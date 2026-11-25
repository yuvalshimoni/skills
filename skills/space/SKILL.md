---
name: space
description: Give a subject that outlives any one chat a durable home on disk, so every fresh session starts from the same shared understanding and several sessions can work on it in parallel.
disable-model-invocation: true
---

You keep coming back to the same subject in new chats. Each thread starts cold, so you re-explain the context, the decisions and why you made them, and the words you use. Meanwhile the real state of the work is scattered across a dozen threads that only you can stitch together. The chat isn't the problem. The problem is that the chat is the only place the work lives.

A **space** gives the work a place to live that isn't a chat. It's a folder: plain files that hold what the work *is* (its purpose, its **shared language**, what was decided and why, what's still open), plus pointers to the repos and sources it touches. Threads become disposable. You start any session in the space, it reads the folder, and it arrives already knowing what you know. The chaos stays in the conversation. The space keeps what was decided.

This skill creates the space through one short conversation. It does not do the work.

## Home, not task

A space is the home of an effort, not a to-do list. It may hold several migrations, ongoing research, or a project with an end, and it doesn't need a finish line. Creating it never picks the first task. That choice belongs to the sessions that start there. If you feel the pull to just start working, the space is ready and it's time to hand off.

## Every fact has one home

Each thing worth keeping lives in exactly one file, and everything else points to it. Purpose, shared language and standing context go in `AGENTS.md`. Supplied material goes in `sources/`. Knowledge that several lines of work need goes in `shared/`. Each line of work gets its own `streams/<name>/README.md`. Dated events that matter beyond one stream go in `LOG.md`. `AGENTS.md` works as a **map**: it gives the gist and links to the file that holds the detail, and never copies it. If a fact lives in two places, they drift apart, and a fresh session can't tell which one is true.

## Parallel by design

Because the understanding lives in files and not in a thread, several sessions can work in one space at once. Each **stream** keeps its own notes, and each connected repo is either a **worktree** (an isolated checkout on its own branch) or a **pointer** (an existing checkout that other work shares). Parallel sessions don't overwrite each other, and none of them needs the conversation where the space was born.

## Mark what you know

Keep the difference between a **decision** (agreed), a **finding** (verified), a **proposal** (suggested) and an **open question** (unknown, with a note on what would answer it). A fresh session that treats a proposal as a decision will build the wrong thing with confidence.

## Ask like a collaborator

Ask one question at a time, in plain language, and end each with **Suggested:** an answer grounded in what the developer has already said. Look up anything you can discover yourself, and ask the developer only for meaning, missing sources and choices.

## Keeping it true

Notes drift as the work moves. Every space ships with its own `space-sync` skill, which checks each stream's notes against the code and the cited evidence, repairs the map, and logs what changed. A space keeps working long after this skill has been uninstalled.

## 1. Understand the purpose

Read the conversation and any sources already supplied. If the purpose is missing, ask **“What is this space for?”** If it is already clear, carry your understanding into the next step.

Understand the subject, why the developer wants a home for it, and what belongs there. A finish line is useful only when the developer's work has one.

**Done when:** you can describe the purpose in the developer's terms, or identify the specific ambiguity to clarify after reading the sources.

## 2. Bring in outside context

Ask for material you would not discover from the code: a Jira ticket or epic, design, document, Slack thread, or earlier conversation. Name anything already supplied.

For example: **“Is there any outside context a fresh session should have?”** Suggested: use the known sources; the developer can send more or say there is nothing else. If they already supplied their sources and said that is all, proceed.

Read the supplied material and inspect relevant repo instructions and code as needed. Use `gh` for GitHub. Read earlier sessions only when the developer points to them. Report access gaps; ask for an excerpt or another source when the missing material blocks understanding.

**Done when:** each supplied source has been read or its access gap recorded, and you know which questions remain after that reading.

## 3. Align on meaning

Ask only questions whose answers change the purpose, shared language, context, boundaries or setup. Aim for a few short exchanges; stop as soon as the completion criterion holds.

Build the glossary from the developer's actual words and the sources. For an ambiguous term, suggest its meaning in this space. Use a concrete example when two interpretations would change what belongs here. Keep obvious terms out of the glossary.

Clarify whether important source material is a proposal, an approved decision, a verified finding or historical context. Preserve reasons, working preferences, permission limits and relevant failed approaches. Conflicting sources need either a resolution or an explicit open question.

Questions that require investigation belong in the space: record what would answer them and whether they limit any work. Ask the developer to resolve only what prevents you from framing or safely setting up the space.

**Done when:** you can write the purpose, important terms and boundaries without an unacknowledged guess; material disagreements and unknowns have a stated status; no choice needed for creation remains hidden.

## 4. Prepare the repos

A space can use no repos, worktrees, pointers, or a mix. When it uses repos, follow [Workspace setup](references/workspace.md) to inspect them and agree on how each connects.

**Done when:** each repo has a proposed mode, exact path and branch plan, plus checkout-only or running scope; or the developer's description makes clear that no repos are needed.

## 5. Reflect back and get approval

Show a short draft introduced with **“Here's the space I'll create. Correct anything that doesn't match what you mean. Nothing has been created yet.”** Include:

- **What it's for:** the purpose and scope, with a proposed name and destination.
- **Words we'll use:** the terms that need a shared meaning.
- **What to know:** important context, decisions, boundaries, uncertainties and source access gaps.
- **Resources and repos:** sources to retain, exact repo setup and what will be created.

Omit empty sections. Highlight suggestions that still need agreement. The draft confirms understanding; the files will carry the full context.

Approval covers the space files and the named worktrees and branches. Installing dependencies, starting services, changing a database, committing and pushing each require an explicit yes for that action. Check that the destination is absent; if it exists, ask for a different destination.

**Done when:** the developer approves the current understanding and exact setup, all creation-blocking choices are settled, and the destination does not exist.

## 6. Create

Read [Writing the space](references/writing-the-space.md) and its named templates. Write the approved space, then execute the repo setup from step 4 within its approved permissions. Keep secrets and unneeded personal data out of every file.

**Done when:** approved context has a home, every template placeholder is resolved, and setup is completed or its remaining gaps are recorded.

## 7. Verify and hand over

Read the files as a fresh session. Check that they answer:

1. What is this space for, and what belongs here?
2. What do its important terms mean?
3. What was agreed, what is verified, and what is uncertain?
4. Which sources and repos should I consult, and when?
5. Where may I edit, which instructions apply, and what needs permission?

Check all links, source pointers, recorded repo paths and branches, and both Claude compatibility links. Confirm the work map matches whatever work folders actually exist. Fix missing answers in their proper home. Report anything you could not verify.

Hand over the path, connected repos, readiness and gaps. A checkout alone is not a running app. Tell the developer to start a fresh agent session from the space folder. Project skills require folder trust: in Pi, use `/trust`; in Claude Code, accept the folder trust prompt.

**Done when:** the files provide shared understanding without this conversation, paths and setup are verified or explicitly marked unverified, and the developer knows how to start a session there.
