# Workspace setup

Use this when the space connects to repos. Prepare the plan before approval; create only after approval.

## Plan each connection

Inspect the checkout, branch, working tree state, remotes and existing worktrees. Verify the real default branch with `gh` or git; fetch when you need current remote refs. Find repo instruction files and applicable setup instructions.

When connecting repos, present both options using the terms **worktree** and **pointer**. Recommend one per repo, explain why, and let the developer choose. A space can mix both modes. Explain where edits will happen:

| Mode | Connection | Where code changes happen |
|---|---|---|
| **Worktree** | A dedicated git checkout at `<space>/repos/<name>/` | In that checkout, on its approved branch |
| **Pointer** | An absolute path recorded in the space's `AGENTS.md`; no checkout or symlink is created | In the existing checkout, which other work may share |

For a **worktree**, propose the source repo, destination, base ref and working branch. State whether the branch is new or existing. Check path and branch availability; git worktrees share the repo's branch namespace, and an already-checked-out branch needs a different plan. Use a new working branch when isolation is wanted.

For a **pointer**, verify the existing path and branch. Its checkout keeps its branch and uncommitted files. Explain that edits affect the shared checkout, not an isolated copy.

Ask whether checkouts are enough or the app must run. Suggest checkout-only unless running is needed. For running, identify the matching setup skill or repo instructions, services and data required. Get explicit permission for each installation, service start and database change; creating the space does not authorize them.

**Ready for approval when:** each connection has exact paths, mode, branch details, applicable instructions and setup scope. Any unavailable path, occupied branch or missing setup procedure has been resolved or clearly deferred.

## Create and record

Recheck paths and branches before executing the approved plan. Stop and ask if they differ. Use `git worktree add -b <branch> <path> <base-ref>` for an approved new branch, or `git worktree add <path> <branch>` for an approved existing branch. Run these from the source repo, using the approved destination path. Verify each resulting checkout's path and branch. A pointer only gets recorded and verified.

Write the **Repos** section of the space's `AGENTS.md` with each path, mode, expected branch, and pointers to repo instructions and run instructions. Name root instructions and tell sessions to read additional instructions along the path to files they touch. Sessions start in the space folder; connected repo instructions need to be read explicitly before editing there.

When a running setup was approved, follow its skill or repo instructions. Save the run procedure and actual verification in `shared/running-the-workspace.md`, linked from **Map**. A listening port proves startup, not that an application flow works. Record exactly what was exercised and any blockers.

**Done when:** all approved connections are documented and verified, and checkout readiness is distinguished from running setup and application verification.
