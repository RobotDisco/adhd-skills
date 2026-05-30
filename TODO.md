# Migration TODOs

Outstanding system-level work. Remove items as completed; delete this file when empty.

- [ ] **Process inbox** — route remaining captured items: operational work out, personal actions to on-deck queue (with dates + effort + context tags) or someday queue.
- [ ] **Re-triage someday queue** — many items are stale. Either commit them (add a date) or drop them.
- [ ] **Downgrade misplaced active items** — some items marked as ready next actions are sitting in the someday queue without dates. Either schedule them or downgrade to uncommitted.
- [ ] **Audit habits** — several tracked habits haven't been touched since April. Either re-establish, reset, or drop. Decide what the system does when a habit lapses for 2+ weeks.
- [ ] **Create project tracker** — set up the execution layer for multi-step projects (see `adr/0002-project-two-layer-model.md`).
- [ ] **Project decomposition pass** — go through the someday queue, identify project-shaped items, create knowledge graph nodes and project tracker entries for them, and leave only the immediate next action in the on-deck queue. Do not do this during inbox triage.
