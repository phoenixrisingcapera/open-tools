#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-$(pwd)}"

mkdir -p "$TARGET_DIR/.opencode/agent" "$TARGET_DIR/.opencode/command" "$TARGET_DIR/.opencode/skills"

cp "$SOURCE_DIR"/opencode/agents/*.md "$TARGET_DIR/.opencode/agent/"
cp "$SOURCE_DIR"/opencode/commands/*.md "$TARGET_DIR/.opencode/command/"
cp -R "$SOURCE_DIR"/opencode/skills/* "$TARGET_DIR/.opencode/skills/"

if [ ! -f "$TARGET_DIR/.opencode/session-kanban.md" ]; then
  cp "$SOURCE_DIR/opencode/templates/session-kanban.md" "$TARGET_DIR/.opencode/session-kanban.md"
fi

cp "$SOURCE_DIR/opencode/open-tools-manifest.json" "$TARGET_DIR/.opencode/open-tools-manifest.json"

printf 'Open Tools installed into %s/.opencode\n' "$TARGET_DIR"
printf 'Restart opencode, then run /toolbox\n'
