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

#### `inbox-triage`

Works through a captured inbox one item at a time, makes a routing decision (on-deck,
someday, work tool, waiting, or delete), and produces a grouped summary to act on.

Triggers automatically when you say things like *"let's go through my inbox"*, *"GTD
sweep"*, or *"process my inbox"*.

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
management (coming), and so on. Each domain is its own installable plugin.

Use the `/skill-creator` skill to add a new skill to an existing domain, or create a new
domain directory and register it in `.claude-plugin/marketplace.json`.

To install skill-creator: `/plugin install skill-creator@claude-plugins-official`

## License

GPLv3. See [LICENSE](LICENSE).
