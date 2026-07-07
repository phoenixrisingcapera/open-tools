---
name: safe-git-workflow
description: Use when committing, pushing, creating PRs, or auditing Git state; enforces status/diff/log checks and avoids destructive git commands.
---

# Safe Git Workflow

Use this skill before committing, pushing, creating PRs, or declaring work complete.

## Rules

- Never use `git reset --hard`, `git checkout --`, `git clean`, force-push, or amend unless explicitly requested and confirmed.
- Before committing, inspect `git status --short --branch`, `git diff`, and `git log --oneline -10`.
- Stage only intended files.
- Do not commit secrets, credentials, tokens, database URLs, cookies, private keys, or generated sensitive files.
- If unrelated changes exist, leave them alone and mention them.
- If committing multiple repos, commit each repo separately with a scoped message.
- After pushing, verify local `HEAD` equals the remote tracking branch.

## Commit Checklist

1. `git status --short --branch`
2. `git diff`
3. `git log --oneline -10`
4. Stage intended files only.
5. `git diff --cached --stat`
6. Commit with a concise message matching repo style.
7. Push only if requested or clearly part of the task.
8. Verify `git status --short --branch` is clean.

## Completion Report

Report:
- commit hash
- pushed branch
- remaining local changes, if any
- tests/checks run
- checks not run and why
