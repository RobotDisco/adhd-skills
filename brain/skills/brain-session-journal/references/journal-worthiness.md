# What's worth a journal entry from a Claude session

The journal is a **life record and fleeting-capture layer**. It is not expected to be
complete, structured, or polished. The bar for an entry is "future me would want to
know this happened or that I learned this." It is not "this is a note seed." The
extraction test (claim + ramification) belongs to `brain-process-notes`. Don't apply
it here.

## Worth an entry

The user asked for three kinds of material. What qualifies in each:

<!--
TODO(user): draw the line for each category, 2–3 bullets each.
The hard part is the boundary between "Claude helped me do a task" (not journal
material) and "something happened or changed in my head" (journal material).
Real examples from 2026-11-25 to calibrate against:
  - INC-96: learned Solr leader election goes by shard term, not doc count
  - CLOUD-1721: looked up whether a pen-test update had been posted, linked it in Slack
  - asked what some EXT-F-7 DNS records were
-->

### Insights
<!-- e.g. a realization about how I work, a pattern noticed, a position I took -->

### New knowledge
<!-- e.g. how a system actually behaves, a diagnostic technique that worked -->

### Notable incidents
<!-- e.g. an outage I led, an all-nighter, a decision with consequences -->

## Not worth an entry

- **Pure task execution.** Claude looked something up, posted an update, edited a file,
  and nothing was learned or decided. That's in the tool's history already.
- **Work already recorded elsewhere at full fidelity.** Ticket updates, incident
  timelines, merged code. Journal the *experience* or the *lesson*, not the artifact.
  ("Pulled an all-nighter on INC-96" is the experience. The incident.io timeline is the
  artifact.)
- **Claude's claims the user never engaged with.** If Claude asserted something and the
  user didn't react, confirm it, or act on it, it isn't the user's knowledge yet.
- **Secrets and credentials.** Never copy tokens, passwords, keys, or connection strings
  into the journal, even when they appear in a session.

## How entries should read

- **First person, the user's register.** Terse, direct, informal. Swearing is fine if
  that's how the user talks in the session. Model it on the user's own journal entries
  from step 3, not on Claude's prose.
- **Lead with the thing, not the process.** "Solr leader election goes by shard term"
  beats "Spent time with Claude investigating Solr leader election."
- **Short.** A heading plus 1–4 lines is typical. A notable incident can run longer,
  with `***` sub-headings for distinct threads, like the user's INC-96 entry. Most
  entries shouldn't.
- **Correct course when a session overturned an earlier belief.** If an earlier journal
  entry stated a theory the session disproved, say so explicitly ("my 18:52 theory was
  right after all"). The user already does this, and it's some of the most valuable
  content in the journal.
- **Don't round up.** A tentative conclusion stays tentative ("lead, not proven").
- **No links to org-roam nodes, no `:ID:` blocks, no tags on headings.**
