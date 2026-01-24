#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title kpiee-infra-dev
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔐
# @raycast.packageName DeveloperTools

# Documentation:
# @raycast.description Open SSH to kpiee-infra-dev in a new tmux window (tab)

set -euo pipefail

TARGET_HOST="kpiee-infra-dev"
WINDOW_NAME="kpiee-infra-dev"
DEFAULT_SESSION="main"

echo "Hello"

if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux not found. Install tmux first."
  exit 1
fi

if [[ -n "${TMUX:-}" ]]; then
  tmux new-window -n "$WINDOW_NAME" "ssh -tt $TARGET_HOST"
  echo "Opened ssh in a new tmux window: $WINDOW_NAME"
  if command -v osascript >/dev/null 2>&1; then
    osascript -e 'tell application "iTerm2" to activate' >/dev/null 2>&1 || true
  fi
  exit 0
fi

# Outside tmux: pick the first existing session, or start a new one.
if tmux list-sessions >/dev/null 2>&1; then
  session="$(tmux list-sessions -F '#{session_name}' | head -n1)"
  # Use session: to avoid ambiguity when the session name is numeric (e.g. "0").
  tmux new-window -t "${session}:" -n "$WINDOW_NAME" "ssh -tt $TARGET_HOST"
  echo "Opened ssh in tmux session: $session"
else
  tmux new-session -d -s "$DEFAULT_SESSION" -n "$WINDOW_NAME" "ssh -tt $TARGET_HOST"
  echo "Started tmux session: $DEFAULT_SESSION"
fi

if command -v osascript >/dev/null 2>&1; then
  osascript -e 'tell application "iTerm2" to activate' >/dev/null 2>&1 || true
fi
