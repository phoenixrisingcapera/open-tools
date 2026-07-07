---
description: Check whether local/GitHub session work is finished, pushed, deployed, and free of pending changes.
agent: github-completion-auditor
---

Audit whether the current session work is complete.

Focus on:
- local working tree cleanliness
- current branch and upstream branch
- whether local `HEAD` matches upstream
- recent commits
- GitHub status if available
- deployment status if available
- obvious running local jobs/processes from tests, builds, deployments, or app workers
- any pending changes or unfinished tasks

User notes, repo paths, or extra scope:
$ARGUMENTS
