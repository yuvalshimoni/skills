---
name: space
description: Create a space through a short conversation, shared understanding, and an approved repo setup.
disable-model-invocation: true
---

# Create a space

A space is a durable home for a subject or effort. It can hold several migrations, ongoing research, or a project with an end. Sessions come and go; the shared understanding stays.

Your job is to understand what the developer means and prepare a home where fresh sessions can work from that understanding. Choosing the first task belongs to those sessions. The result is plain files: its own instructions keep it useful without this creation skill installed.

## Conversation style

When asking a question, use plain language, ask one at a time, and end with **Suggested:** an answer grounded in what the developer has shared. Confirm known choices together in the approval draft rather than asking them again. Look up discoverable facts yourself; ask the developer for meaning, missing sources and choices.

The steps below guide your process; present the conversation as a few natural exchanges, not a numbered interview. Let the missing understanding determine the questions. Distinguish what the developer agreed, what you verified, what you suggest and what remains uncertain; use those distinctions where they matter rather than tagging every sentence.

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

A space can use no repos, worktrees, pointers, or a mix. When it uses repos, follow [Workspace setup](references/workspace.md) to inspect them and agree on how each connects. This is setup, not a request to choose the first task.

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

Hand over the path, connected repos, readiness and gaps. A checkout alone is not a running app. Tell the developer to start a fresh agent session from the space folder; that session can choose the work. Explain that the local `space-sync` skill checks notes when they drift. Project skills require folder trust: in Pi, use `/trust`; in Claude Code, accept the folder trust prompt.

**Done when:** the files provide shared understanding without this conversation, paths and setup are verified or explicitly marked unverified, and the developer knows how to start a session there.
