#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE="$REPO_ROOT/skills/personalized-learning"

if [[ ! -d "$SOURCE" ]]; then
  echo "Skill source not found: $SOURCE" >&2
  exit 1
fi

DEST_ROOT="${1:-${CODEX_HOME:-$HOME/.codex}/skills}"
DEST="$DEST_ROOT/personalized-learning"

if [[ -e "$DEST" ]]; then
  echo "Destination already exists: $DEST" >&2
  echo "Remove it first or pass a clean destination root." >&2
  exit 1
fi

mkdir -p "$DEST_ROOT"
cp -R "$SOURCE" "$DEST"

echo "Installed personalized-learning skill to: $DEST"
echo "Restart Codex to pick up new skills."

