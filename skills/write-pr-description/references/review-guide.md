# Organize the Review Guide by dependency

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

| File           | Status                 |
| -------------- | ---------------------- |
| `path/to/file` | added/modified/deleted |

</details>

---

### Level 1: <Changes that depend on Root>

**<description>**

<details>
<summary>X files</summary>

| File           | Status                 |
| -------------- | ---------------------- |
| `path/to/file` | added/modified/deleted |

</details>
```
