---
name: new-skill
description: Add a new agent skill to this repo with valid frontmatter, a matching folder name, and the optional Codex and Claude plugin wiring.
disable-model-invocation: true
---

# New skill

Create one skill in this repo. Do not write application code. Do not copy skills from other repos unless the user pastes them.

## 1. Interview (do this first)

Ask, one question at a time, until you have answers for all of these:

- **Name**: lowercase kebab-case, 1-64 characters, letters, numbers, and single hyphens only. Must match the folder name.
- **Job**: what the agent should do when this skill is active.
- **Trigger**: when a human should type `/name`, and (if model-invoked) when the agent should reach for it on its own.
- **Invocation**:
  - **User-invoked** if only the human should start it (a flow, a router, a one-off setup).
  - **Model-invoked** if the agent should fire it autonomously, or another skill must call it.
- **Steps vs reference**: ordered actions the agent performs, plus any rules it should consult.

Do not create files until the user confirms the name and invocation.

## 2. Write the files

Create `skills/<name>/SKILL.md` with this shape:

```markdown
---
name: <name>
description: <one or two sentences: what it does, and when to use it>
disable-model-invocation: true   # only for user-invoked skills; omit otherwise
---

# <Title>

## Steps

1. ...
2. ...
```

Rules for the frontmatter:

- `name` is required. It must equal the parent directory name.
- `description` is required, 1-1024 characters, no XML tags.
- For **user-invoked** skills: set `disable-model-invocation: true`. Keep the description short and human-facing. Do not pack it with "Use when the user says…" trigger lists.
- For **model-invoked** skills: omit `disable-model-invocation`. Write a model-facing description that names the distinct cases that should fire it.

Create `skills/<name>/agents/openai.yaml` (Codex picker; optional but keep it in this repo):

User-invoked:

```yaml
interface:
  display_name: "Human Title"
  short_description: "One short line"
policy:
  allow_implicit_invocation: false
```

Model-invoked (no `policy` block):

```yaml
interface:
  display_name: "Human Title"
  short_description: "One short line"
```

Keep invocation in sync: user-invoked in **both** `SKILL.md` and `openai.yaml`, or in neither.

Optional extra files in the same folder, only if the body would otherwise bloat:

- `scripts/` executable helpers
- `references/` docs the agent reads on demand
- `assets/` templates

Keep `SKILL.md` under 500 lines. Point at sibling files instead of nesting them.

## 3. Register it

If `.claude-plugin/plugin.json` exists, append `"./skills/<name>"` to the `skills` array.

Add a one-line entry to the skill list in `README.md`.

## 4. Check

Run `./scripts/validate.sh`. Fix anything it reports. Show the user the new path and how to try it:

```bash
npx skills add . --list
```

After they publish the repo:

```bash
npx skills add <owner>/<repo> --skill <name>
```

## Do not

- Put `SKILL.md` at the repo root (that makes this a single-skill repo).
- Use uppercase, spaces, underscores, or consecutive hyphens in `name`.
- Start another user-invoked skill from this one. Tell the human to type it.
