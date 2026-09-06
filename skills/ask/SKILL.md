---
name: ask
description: Router over the skills in this repo. Ask which skill or flow fits the current situation.
disable-model-invocation: true
---

# Ask

You do not remember every skill. Ask.

Read every `skills/*/SKILL.md` in this repo (frontmatter only is enough) and recommend one skill. If two could apply, say why and pick one.

## How to choose

1. If the user wants to **add or edit a skill in this repo**, send them to `/new-skill`.
2. If they named a skill that exists, tell them to run it. Do not run a user-invoked skill yourself.
3. If nothing here fits, say so. Do not invent a skill on the spot. Offer to run `/new-skill` to create one.

## Rules

- This skill only routes. It does not implement the work.
- User-invoked skills (`disable-model-invocation: true`) can only be started by the human. Name them as `/skill-name` and wait.
- Model-invoked skills can be started by calling the Skill tool with that skill's `name`.
