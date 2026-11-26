#!/usr/bin/env bash
# Condense Claude Code session transcripts into a readable digest for one local date.
#
# Usage:
#   extract-sessions.sh [YYYY-MM-DD] [--list] [--session <session-id>] [--max-chars N]
#
#   --list     one line per session (time span, title, cwd, digest size): pick
#              which sessions to read in full before reading any of them.
# Defaults: today's local date, all sessions across all projects, assistant
# messages truncated to 1200 chars. Output: one block per session (title, cwd,
# local time span), then a timestamped dialogue of human text and assistant
# prose. Tool calls, tool results, hook output, subagent sidechains and
# harness-injected messages are dropped. They're noise for a life record.

set -euo pipefail

date_arg="$(date +%Y-%m-%d)"
session=""
max_chars=1200
list=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --list) list=true; shift ;;
    --session) session="$2"; shift 2 ;;
    --max-chars) max_chars="$2"; shift 2 ;;
    -h|--help) sed -n '2,15p' "$0"; exit 0 ;;
    *) date_arg="$1"; shift ;;
  esac
done

root="${CLAUDE_PROJECTS_DIR:-$HOME/.claude/projects}"

# Candidate files: anything touched on or after the target date. Precise
# filtering by message timestamp happens in jq below.
# (while-read rather than mapfile: works on macOS's stock bash 3.2 too.)
if [[ -n "$session" ]]; then
  find_args=(-name "${session}.jsonl")
else
  find_args=(-name '*.jsonl' -newermt "$date_arg")
fi
files=()
while IFS= read -r line; do files+=("$line"); done < <(find "$root" -maxdepth 2 "${find_args[@]}")

[[ ${#files[@]} -eq 0 ]] && { echo "No sessions found for $date_arg."; exit 0; }

for f in "${files[@]}"; do
  jq -rs --arg day "$date_arg" --argjson max "$max_chars" --argjson list "$list" '
    def local_ts: .timestamp | sub("\\.[0-9]+Z$"; "Z") | fromdate;
    def injected: test("^\\s*<(command-|local-command|system-reminder|task-notification|bash-)") or startswith("Caveat:");
    def clip($n): if length > $n then .[0:$n] + " […]" else . end;
    def text_of:
      if (.message.content | type) == "string" then .message.content
      else [.message.content[]? | select(.type == "text") | .text] | join("\n") end;

    (map(select(.type == "ai-title")) | last | .aiTitle // "(untitled)") as $title
    | [ .[]
        | select((.type == "user" or .type == "assistant")
                 and (.isSidechain | not) and (.isMeta | not) and .timestamp != null)
        | select((local_ts | strflocaltime("%Y-%m-%d")) == $day)
        | { t: (local_ts | strflocaltime("%H:%M")), who: .type, cwd: .cwd, text: (text_of | gsub("^\\s+|\\s+$"; "")) }
        | select(.text != "" and (.text | injected | not))
      ] as $msgs
    | (input_filename | split("/") | last | rtrimstr(".jsonl")) as $id
    | if ($msgs | length) == 0 then empty
      elif $list then
        "\($msgs[0].t)–\($msgs[-1].t)  \($title)  [\($msgs[0].cwd)]  ~\($msgs | map(.text | length) | add / 1000 | floor)k chars  \($id)"
      else
        "=== \($title)\n    cwd: \($msgs[0].cwd)  |  \($msgs[0].t)–\($msgs[-1].t)  |  session: \($id)\n"
        + ($msgs | map(
            if .who == "user" and (.text | startswith("This session is being continued"))
              then "[\(.t)] (COMPACTION SUMMARY of earlier context, may predate this day): \(.text | clip(2500))"
            elif .who == "user" then "[\(.t)] ME: \(.text | clip(3000))"
            else "[\(.t)] CLAUDE: \(.text | clip($max))" end
          ) | join("\n\n"))
        + "\n"
      end
  ' "$f"
done | awk -v d="$date_arg" '{ print } END { if (NR == 0) print "No sessions found for " d "." }'
