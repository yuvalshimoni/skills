---
name: write-pr-description
description: Write or update a pull request description from the current branch diff.
---

# Write PR Description

Write a pull request description that helps a reviewer quickly understand what changed, why it changed, and where to focus their attention.

## 1. Scope the PR changes

Identify the files changed by the current PR and understand the changes within those files.

Use the PR's changed files and their diff as the source of truth.

Do not read, infer from, or reference files outside the PR's changed-file set unless they are explicitly provided as context by the user.

Base every statement in the PR description on the scoped changed files or on context explicitly provided by the user.

## 2. Choose the description format

Pick the format that lets a reviewer understand the PR fastest. Do not use both full sections when one is enough.

**Option A — Summary only.** Use when the PR is primarily an internal refactor, configuration or infrastructure change, or logic change with no meaningful visible API surface. Code examples would add little value.

**Option B — At a Glance only.** Use when the PR is primarily an interface or contract change, such as a changed API, prop, schema, event, configuration, endpoint, component, hook, service, or export. Use a small code, request, schema, or configuration example when it communicates the change faster than prose. Avoid prose that merely restates the example.

**Option C — Both.** Use when the PR combines interface or contract changes with context that examples alone cannot explain. Keep the Summary to 1-2 short sentences covering only what the examples do not make obvious.

Template:

```markdown
<title>

## Summary

<1-4 short paragraphs. Omit for Option B. Keep to 1-2 sentences when paired with At a Glance.>

## At a Glance

<minimal code examples. Omit for Option A.>

## Why

<why these changes are being made — max 100 words>
```

### Summary rules

- Group related changes into short paragraphs of 2-4 sentences.
- Keep one theme per paragraph.
- Lead with the most important change.
- Use inline code for identifiers such as `UserService`, `POST /api/users`, or `users.role`.
- Avoid bullet lists.
- If the PR has one concern, one paragraph is enough.

### At a Glance rules

- Use fenced code blocks with the appropriate language.
- For interface or contract changes, prefer a Before / After example.
- Show only the changed lines plus enough context to orient the reviewer.
- For new components, hooks, endpoints, services, jobs, schemas, or configuration, show one short realistic usage, request, query, or configuration example.
- Include at most 2-3 examples and choose only the most impactful ones.
- Do not add explanatory prose inside the section beyond a short bold heading for each example.

Need a worked example? Read [references/at-a-glance-examples.md](references/at-a-glance-examples.md).

## 3. Decide whether a Review Guide is useful

Include a Review Guide only when it materially helps a reviewer navigate a medium-to-large PR where changed files serve different roles.

Use it when the PR contains relationships such as:

- core logic + consumers
- utility + integrations
- implementation + exports
- core change + tests or docs

Skip it for:

- small PRs
- single-concern changes
- PRs where the file grouping would simply repeat the description

When in doubt, omit it.

If you include a Review Guide, read [references/review-guide-grouping.md](references/review-guide-grouping.md) for reviewer-oriented grouping and the template.

## Constraints

Include:

- A clear explanation of what changed and why.
- Relevant issue links when available.
- Context that is important but not obvious from the code.
- Notes about areas that deserve careful review.

Do not include:

- Test Plan sections.
- Testing checklists.
- Redundant summaries of the diff.
- Unrelated repository context.
- Claims about files or behavior outside the scoped PR changes.

Do not duplicate information between Summary and At a Glance. If a code example already communicates the change clearly, shorten or remove the corresponding prose.

Keep code examples minimal and focused on the changed surface rather than reproducing full files.
