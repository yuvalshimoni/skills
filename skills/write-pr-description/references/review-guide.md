# Organize the Review Guide for the reviewer

When a Review Guide is useful, organize only the changed files in the PR by review order and concern.

Use dependency order by default, but group parallel changes by review concern when that creates a clearer path.

- **Start here** — the behavior, contract, schema, or other core change that frames the PR.
- **Then review** — consumers, integrations, persistence, and other changes that build on the core.
- **Finish with** — tests, documentation, configuration, exports, generated files, and supporting changes.

Name each group after its actual concern. Explain why the files belong together and add a **Focus** note only when the reviewer should inspect a specific risk, invariant, or tradeoff.

List files directly. Do not hide them in `<details>` blocks or repeat added/modified/deleted status that the PR interface already shows.

Use this format:

```markdown
## Review Guide

### 1. Start here: <Core concern>

<Why these files belong together and why the reviewer should start here.>

- `path/to/file`
- `path/to/another-file`

**Focus:** <Specific risk, invariant, or tradeoff. Omit when there is none.>

### 2. Then review: <Dependent or parallel concern>

<How this group relates to the core change.>

- `path/to/file`
- `path/to/another-file`

**Focus:** <Specific risk, invariant, or tradeoff. Omit when there is none.>

### 3. Finish with: <Supporting concern>

<What these supporting files verify, document, configure, or expose.>

- `path/to/file`
```
