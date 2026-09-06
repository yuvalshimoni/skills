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

**Option B — At a Glance only.** Use when the PR is primarily an API or prop change, a new component or hook, a renamed export, or another change that is clearest through a small code example. Avoid prose that merely restates the code.

**Option C — Both.** Use when the PR combines visible API changes with context that code alone cannot explain. Keep the Summary to 1-2 short sentences covering only what the examples do not make obvious.

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
- Use inline code for identifiers such as `LabelValue` or `create-pr`.
- Avoid bullet lists.
- If the PR has one concern, one paragraph is enough.

### At a Glance rules

- Use fenced code blocks with the appropriate language.
- For API or prop changes, prefer a Before / After example.
- Show only the changed lines plus enough context to orient the reviewer.
- For new components or hooks, show one short realistic Usage example.
- Include at most 2-3 examples and choose only the most impactful ones.
- Do not add explanatory prose inside the section beyond a short bold heading for each example.

Example of a prop rename:

````markdown
## At a Glance

**`LabelValue` — prop rename**

```diff
- <LabelValue overline="Status" value="Active" />
+ <LabelValue label="Status" value="Active" />
```
````

Example of a new component:

````markdown
## At a Glance

**New `AssetDescriptor` component**

```tsx
<AssetDescriptor icon={<ServerIcon />} name="prod-db-01" type="Database Instance" />
```
````

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

## 4. Organize the Review Guide by dependency

When a Review Guide is useful, organize only the changed files in the PR by review dependency.

- **Root** — the core change and best place to start reviewing.
- **Level 1** — changes that directly depend on the root.
- **Level 2+** — downstream changes such as tests, documentation, examples, exports, or integration points.

Use this format:

```markdown
## Review Guide

### Root: <Core Change>

**<description>**

<details>
<summary>X files</summary>

| File              | Status                 |
| ----------------- | ---------------------- |
| `path/to/file.ts` | added/modified/deleted |

</details>

---

### Level 1: <Changes that depend on Root>

**<description>**

<details>
<summary>X files</summary>

| File              | Status                 |
| ----------------- | ---------------------- |
| `path/to/file.ts` | added/modified/deleted |

</details>
```

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
