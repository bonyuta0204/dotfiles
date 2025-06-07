#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"

# shellcheck disable=SC1091
source "$DOTFILES_DIR/lib/util.sh"

# Check if we can deploy Claude Code settings
if ! command -v claude &> /dev/null; then
    echo "Claude Code is not installed, but settings will be deployed for future use"
fi

# Deploy settings using Makefile
cd "$SCRIPT_DIR" || exit 1
make deploy

echo "Claude Code setup completed!"
echo "Settings deployed to ~/.claude/settings.json"
echo ""
echo "Configured settings:"
echo "  - Co-authored-by Claude in commits: enabled"
echo "  - Chat cleanup period: 30 days"
echo "  - Safe command permissions configured"
echo "  - Telemetry enabled"