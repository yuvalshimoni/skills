# Yuval's skills

Agent skills for Cursor, Claude Code, Codex, and other agents. Install with `npx skills`.

## Skills

**User-invoked** (you type them)

- [`/ask`](./skills/ask/SKILL.md) — which skill should I run?
- [`/new-skill`](./skills/new-skill/SKILL.md) — add another skill to this repo

**Model-invoked** (you or the agent can start them)

- [`/write-pr-description`](./skills/write-pr-description/SKILL.md) — write a reviewer-focused PR description from the branch diff

## Layout

```
skills/
  ask/SKILL.md
  new-skill/SKILL.md
  write-pr-description/SKILL.md
```

Each skill is a folder with a `SKILL.md`. The file starts with YAML frontmatter: `name` (must match the folder) and `description`. Optional files:

- `agents/openai.yaml` — Codex picker title
- `.claude-plugin/` — Claude Code plugin listing

## Install

```bash
npx skills@latest add yuvalshimoni/skills
```

From a local checkout:

```bash
npx skills@latest add . --list
```

Claude Code, as a local marketplace:

```
/plugin marketplace add .
/plugin install yuval-skills@yuval
```

Pick one path. The plugin is a managed bundle. `npx skills` writes files you own.

## Add a skill

In an agent session on this repo, run `/new-skill`. Or create the folder by hand and run:

```bash
./scripts/validate.sh
```
