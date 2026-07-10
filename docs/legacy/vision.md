# Vision: Open Tools As A Visible Agent Toolbox

Open Tools should feel like a small operating system for AI-assisted work, not a folder of prompts.

## Desired Experience

1. Install Open Tools into a project.
2. Restart opencode.
3. See a visible command such as `/toolbox`.
4. Choose from a simple menu: memory, preflight, product, frontend, backend, QA, Railway deploy, AI workflow design.
5. Let the selected specialist agent do the work.

## What Works Today

opencode can load project-local agents and commands from `.opencode/`.

This repo provides:

- agents
- slash commands
- skills
- templates
- `scripts/install-opencode-tools.sh`
- `/toolbox` as a navigator command
- `opencode/open-tools-manifest.json` as a machine-readable catalog

## Future UI Idea

A true small dropdown button inside opencode would likely need one of these:

- native opencode support for browsing installed agent packs
- an opencode plugin hook that contributes menu items
- a TUI command picker that reads `open-tools-manifest.json`
- a future `opencode install github:user/repo` style package flow

Until that exists, `/toolbox` is the lightweight substitute: it gives users a visible menu and routes them to the right command.

This is future work, not a current product claim.

## ADHD-Friendly Design Principles

- Use one memorable entry point: `/toolbox`.
- Keep menus short and numbered.
- Group commands by intent, not implementation.
- Provide copy/paste commands.
- Persist context in files so memory does not depend on tokens.
- Prefer status dashboards and checklists over long prose.
- Make architecture drift visible before coding: endpoints, contracts, frontend wiring, duplicate files, and pruning paths.
- Treat full-stack endpoint work as one chain: backend route, service, schema, frontend client, UI state, and rendered result.

## Next Product Steps

- Add screenshots or terminal recordings.
- Add one-line examples for every command.
- Add pack-level installers: memory-only, preflight-only, full install.
- Add a generated command catalog from `open-tools-manifest.json`.
- Propose an opencode plugin or upstream feature for agent-pack discovery.
