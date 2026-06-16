# Note shapes — per-kind assessment criteria

Use this table during the random note encounter to assess whether a note is in
zettelkasten shape. The "link check" column distinguishes outgoing links (in the
note body) from incoming links (visible in the org-roam backlinks buffer).

## Shape table

| Kind | Shape question | Link check |
|---|---|---|
| `:fleeting:` | Is there a claim worth elaborating, or is this stale? | No links expected — unprocessed by definition |
| `:literature:` | Core claim in your words? Has it produced permanent notes? | Needs at least a `ROAM_REFS:` link to source; ideally outgoing links to ZK nodes it generated |
| `:permanent:` | Is the title a claim, not a topic? | Needs at least one outgoing link to a concept; check backlinks buffer for incoming |
| `:runbook:` | Findable from the task it serves? Still accurate? | Check backlinks buffer — something should point here from the concept or domain it serves |
| `:person:` | Linked to contexts where this person appears? | Check backlinks buffer primarily — this is a destination, not a navigator |
| `:business:` | Linked to contexts where this entity appears? | Check backlinks buffer — what is the current relationship with this entity? |
| `:project:` | Linked to GTD? Has outcome / done-looks-like? | Outgoing link to GTD; incoming from permanent notes it draws on |
| `:area:` | Reflects current state of this domain? | Both: outgoing to active projects and permanent notes; incoming from things in the domain |
| `:resource:` (legacy) | What is this actually? | Retag to `:runbook:` or `:permanent:` first, then apply the right criteria |

## Notes on links

- **`:fleeting:`** — no links expected. The note is unprocessed.
- **`:permanent:`** — outgoing links are required. A permanent note with no connections
  does not functionally exist in the graph.
- **`:runbook:`, `:person:`, `:business:`** — these are destination nodes. Check the
  backlinks buffer rather than the note body. No incoming links means the note is
  unreachable — it won't surface when you need it.
- **Multiple lifecycle tags** (e.g. `:literature:` + `:fleeting:`) — apply the more
  specific tag's criteria. `:fleeting:` signals the note is unfinished, not that it
  should be assessed differently.
- **No lifecycle tag at all** — definite gap. Identify the kind before assessing shape.

## The test for :permanent: vs :runbook:

Would you open this note to *do* something, or to *think* about something?

- *Do* → `:runbook:`
- *Think* → `:permanent:`

A note that looks like reference material but has a claim hiding in it belongs in
`:permanent:`. Write the claim if it isn't there yet.
