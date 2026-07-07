# 0010: Project granularity — when a project earns an org-roam node

**Date**: 2026-06-01
**Status**: Accepted

## Context

Multi-step projects can live at two levels in the system:

- **Tier 2 (inline):** a `:project:` subtree in `personal.org` with subtask headings.
  Execution and task tracking in one place. No separate knowledge artifact.

- **Tier 3 (two-layer):** an org-roam node (`:project:` filetag) holding knowledge,
  decisions, and learnings; plus a `:project:` subtree in `personal.org` for execution,
  linking back to the roam node.

A clear, durable rule is needed for which tier applies. The obvious candidate is project
size (number of steps), but size turns out to be a poor proxy.

## Decision

The criterion is **knowledge production**, not size.

**Tier 3 (org-roam node warranted):** the project involves decisions worth recording,
produces insights that might connect to other ideas, or draws on knowledge from the
zettelkasten. The roam node is where you think; personal.org is where you act.

**Tier 2 (personal.org only):** the project is purely executory — sequenced physical
actions with no lasting knowledge value. The task list IS the project.

Examples:
- Tier 2: fix the shower, set up a new device, run an errand cluster, process a backlog
- Tier 3: GTD/PKM system design, career decision, technical research, anything that
  produces insights worth keeping or connecting to other notes

## Alternatives considered

**Size-based cutoff (2–5 steps → Tier 2, more → Tier 3)** — rejected. Size does not
predict knowledge value. A 10-step home repair is still purely executory; a 3-step
career decision produces lasting knowledge. Size is a symptom, not the cause.

**Everything in org-roam** — rejected. Creates roam nodes for projects that have no
knowledge content. Noise in the knowledge graph; overhead for no benefit.

**Everything inline in personal.org** — rejected. Loses the knowledge graph for projects
that genuinely produce insights. Learnings from a project have nowhere to live that
connects to the rest of the zettelkasten.

## Consequences

- Most day-to-day projects are Tier 2. Tier 3 is reserved for genuine knowledge projects.
- During triage: project-shaped items go to Someday without a tier decision. The tier
  decision happens at decomposition time (weekly review or dedicated project pass).
- All projects, regardless of tier, live in `personal.org * Active` as `:project:`
  subtrees. This is what makes overcommitment visible and enables stuck-project detection.
- A project is **stuck** when its NEXT step has a SCHEDULED date in the past and hasn't
  moved. The intervention is explicit: re-activate (new NEXT + date), PAUSED (with a
  note on why), or ABANDONED. Drift without a decision is not an option.
- The same "knowledge value, not size" logic governs note *atomicity* at the grain level —
  see [[0019]].
