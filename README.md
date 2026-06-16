# adhd-skills

A personal collection of [Claude Code](https://claude.ai/code) skills for managing life
with ADHD — task management, knowledge capture, review rituals, and other executive
function workflows, automated through Claude.

These are curated for my own setup and reflect my own system design decisions. They may
be useful as a reference or starting point if your system is similar, but they're not
a general-purpose toolkit.

## Plugins

### `gtd`

Skills for GTD task management.

#### `gtd-triage`

Works through a captured inbox one item at a time, makes a routing decision (on-deck,
someday, work tool, waiting, or delete), and produces a grouped summary to act on.

Triggers automatically when you say things like *"let's go through my inbox"*, *"GTD
sweep"*, or *"process my inbox"*.

#### `gtd-review`

Interactive GTD system health check. Audits habits, tickler, active board, and someday.
Ensures every commitment is honest and every project has a live next action.

Triggers automatically when you say things like *"GTD review"*, *"weekly review"*, or
*"how does my system look"*.

### `brain`

Skills for org-roam knowledge management.

#### `brain-weekly-review`

Weekly zettelkasten review. Assesses one random note for zettelkasten shape (with
per-kind criteria for permanent, literature, runbook, person, business, project, and
area notes), then guides a structured reflection on the week. Surfaces one recurring
thread from your answers at the end.

Runs standalone — does not require the GTD review to have run first. In the full weekly
ritual, runs after `gtd-triage` and `gtd-review`.

Triggers automatically when you say things like *"brain review"*, *"weekly brain"*, or
*"knowledge review"*.

## Installation

You need [Claude Code](https://claude.ai/code) installed and running.

**1. Register this repo as a marketplace** (once per machine):

```
/plugin marketplace add RobotDisco/adhd-skills
```

**2. Install whichever plugins you want:**

```
/plugin install gtd@adhd-skills
```

Skills activate immediately — no restart needed.

## Adding a skill

Skills are organised by domain — `gtd/` for task management, `brain/` for knowledge
management, and so on. Each domain is its own installable plugin.

Use the `/skill-creator` skill to add a new skill to an existing domain, or create a new
domain directory and register it in `.claude-plugin/marketplace.json`.

To install skill-creator: `/plugin install skill-creator@claude-plugins-official`

## Influences

The system design draws on these sources — see [SOURCES.md](SOURCES.md) for annotations
on how each one shapes the decisions made here.

| Source | What it contributes |
|---|---|
| [Russell Barkley](https://www.russellbarkley.org/) | Executive function model of ADHD — the neurological why behind every design choice |
| [Dr. K / HealthyGamerGG](https://coaching.healthygamer.gg/guide/modules/adhd) | Behavioural translation of clinical ADHD research for modern, screen-heavy environments |
| [How to ADHD](https://www.youtube.com/@HowtoADHD) (Jessica McCabe) | Practical reframes: system failures as design bugs, not character flaws |
| [Midwest Magic Cleaning](https://www.youtube.com/@MidwestMagicCleaning) (Jason) | The Fluid Method — start moving things, don't plan before you begin; applies to all messes |
| [Jesse J. Anderson](https://www.extrafocusbook.com/) | 4 Cs motivation framework: ADHD runs on Challenge, Competition, Creativity, Completion |
| [David Allen](https://gettingthingsdone.com/) — *Getting Things Done* | Structural backbone: one inbox, next physical action, someday/maybe |
| [Developer Tea](https://developertea.com/) (Jonathan Cutrell) | A project needs a goal *and* a deadline — missing either, it's a dream |
| [Conn & McLean](https://bulletproofproblemsolving.com/) — *Bulletproof Problem Solving* | MECE decomposition for the project breakdown workflow (not yet built) |

## License

GPLv3. See [LICENSE](LICENSE).
