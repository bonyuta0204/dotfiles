#!/bin/bash
#
set -eu

BREWFILE="$HOME/Brewfile"
PLISTFILE="$HOME/Library/LaunchAgents/com.bonyuta0204.brew.plist"

# Check if brew is installed
if command -v brew > /dev/null; then
  # Create symlink for Brewfile
  ln -sf "$(realpath Brewfile)" "$BREWFILE"
  
  # Check if the system is macOS
  if [[ "$(uname)" == "Darwin" ]]; then
    # Create symlink for plist and load LaunchAgent
    ln -sf "$(realpath brew.plist)" "$PLISTFILE"
    launchctl unload "$PLISTFILE"
    launchctl load "$PLISTFILE"
  else
    echo "This script is intended to create symlink for Brewfile on non-macOS systems."
  fi
else
  echo "Homebrew is not installed."
  exit 1
fi

