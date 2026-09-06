# Yuval's skills

A personal [Agent Skills](https://agentskills.io/specification) repo. Installable with `npx skills` into Cursor, Claude Code, Codex, and other agents.

This is the **minimum** that actually installs. It is not a fork of [mattpocock/skills](https://github.com/mattpocock/skills). That repo is a product on top of the same standard.

## Reverse engineering: what is required

`npx skills add owner/repo` does not read Matt's `package.json`, changesets, docs site, issue-tracker setup, or `CONTEXT.md`. It walks a few well-known folders, finds directories that contain a `SKILL.md`, and copies them.

### Absolute minimum (one skill)

```
my-skill/
└── SKILL.md
```

`SKILL.md` must start with YAML frontmatter:

```markdown
---
name: my-skill
description: What it does, and when to use it.
---

# My skill

Instructions the agent follows when this skill is active.
```

Rules that the spec and the installer both enforce:

- `name` and `description` are required.
- `name` is lowercase kebab-case, 1-64 characters, and **must match the folder name**.
- `description` is 1-1024 characters. For model-invoked skills, say both what it does and when to fire it.

A repo with a single `SKILL.md` at the root is a one-skill repo. A repo with several skills uses a catalog folder.

### Minimum for a multi-skill repo (this repo)

```
skills/
  ask/SKILL.md
  new-skill/SKILL.md
```

That is enough for:

```bash
npx skills add . --list
npx skills add . --skill new-skill
```

The installer looks in `skills/` first (then other agent folders). It walks up to three levels, so both `skills/<name>/SKILL.md` and `skills/<bucket>/<name>/SKILL.md` work. Buckets are organization, not a requirement.

### Optional, but useful

| File | Why it exists | Required to install? |
| --- | --- | --- |
| `skills/<name>/agents/openai.yaml` | Codex picker title, plus `allow_implicit_invocation: false` for user-only skills | No |
| `disable-model-invocation: true` in frontmatter | Claude: only the human can start the skill | No |
| `.claude-plugin/plugin.json` | Claude Code plugin listing | No (`npx skills` also reads it if present) |
| `.claude-plugin/marketplace.json` | Install this repo as its own marketplace | No |
| Bucket folders, `docs/`, `CONTEXT.md`, ADRs | Matt's process, not the skill format | No |
| `package.json` + changesets | Matt's versioning of the plugin | No |

Matt's repo also adds a one-time `/setup-matt-pocock-skills` that wires an issue tracker, triage labels, and domain docs. That is how *his* engineering flow works. It is not part of making a skill installable.

## Skills in this repo

**User-invoked** (you type them; the agent will not start them on its own)

- [`/ask`](./skills/ask/SKILL.md) — which skill should I run?
- [`/new-skill`](./skills/new-skill/SKILL.md) — add another skill to this repo

## Install

After this repo is on GitHub:

```bash
npx skills@latest add <owner>/<repo>
```

From a checkout (now):

```bash
npx skills@latest add . --list
```

Claude Code, from this repo as a local marketplace:

```
/plugin marketplace add .
/plugin install yuval-skills@yuval
```

Pick one install path. The plugin is a managed bundle. `npx skills` writes files you own.

## Add a skill

In an agent session on this repo, run `/new-skill`. Or create the folder by hand and run:

```bash
./scripts/validate.sh
```

## Grow later, if you want

When you have more than a handful of skills:

1. Split `skills/` into buckets (`engineering/`, `productivity/`) if the list gets hard to scan.
2. Keep a router (`/ask`) updated so you only have to remember one command.
3. Add `.claude-plugin` skill entries as you go (the validator checks they exist).
4. Only then consider Matt-style extras: a `CONTEXT.md` glossary, ADRs, issue-tracker skills, TDD/review loops.

Those extras change how you *work*. They do not change whether a skill installs.
