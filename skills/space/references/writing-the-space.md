# Writing the space

Read all templates below before writing. Use `~/Documents/spaces/<slug>/` unless the developer chose another destination.

## Preserve the understanding

Write from the full conversation and sources. The approval draft is only a summary.

- Preserve the developer's intended meaning and strength. Quote requirements and decisions where the exact wording matters.
- Keep approved decisions, verified findings, proposals and assumptions distinct. Record the reason given for a decision, or say the reason was not recorded.
- Use the corrected understanding when the developer changes their mind. Keep relevant failed approaches with the conditions under which they failed.
- Include only glossary terms whose meaning affects this space. Record unresolved meanings explicitly rather than inventing definitions.
- Give each open question an answering source or investigation and any limits it imposes on work.
- Preserve permission boundaries exactly. A space may be ongoing; record a finish line only if one was agreed.

## Write the files

| Path in the space | Content |
|---|---|
| `AGENTS.md` | Fill [the template](../templates/AGENTS.md.template). Copy **How to work here** unchanged; fill the other sections from approved understanding. Omit empty contextual sections. |
| `LOG.md` | Heading plus dated creation entry. Add durable decisions settled during setup, with pointers to their home. Append future events at the end. |
| `sources/<name>.md` | Useful supplied context, its origin, retrieval date, status and access gaps. Preserve attribution; separate original material from summaries. |
| `shared/<topic>.md` | Derived knowledge needed by several lines of work, only when there is something to retain. |
| `.agents/skills/space-sync/SKILL.md` | Copy [the sync template](../templates/space-sync/SKILL.md.template) unchanged. |
| `CLAUDE.md` | One line: `@AGENTS.md` |
| `.claude/skills/space-sync` | Relative symlink to `../../.agents/skills/space-sync` |
| `.gitignore` | `repos/` and `.DS_Store`, one per line. |

Every session needs it: put it in `AGENTS.md`. Useful only when relevant: keep it in `sources/` or `shared/`, with a pointer under **Map** saying when to read it. Link stable reachable sources; preserve useful excerpts from material that may change or become inaccessible, with secrets removed. Mark inaccessible sources as unavailable, not as read.

Creation does not require a first task, a work folder or a milestone. Keep any existing work context the developer supplied, but let future sessions create work folders when actual work begins. Initially **Map** can simply say that no work has been recorded yet, followed by source and shared-document pointers.

Keep repo setup in **Repos**. The map links contextual material and work; it does not duplicate their contents. Every meaningful item from the conversation belongs in one home.
