#!/bin/bash
# MacOS settings script
echo "Setting up macOS preferences..."

# Disable press-and-hold for keys (enables key repeat)
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a fast key repeat rate
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the Dock auto-hide delay to zero
defaults write com.apple.dock autohide-delay -float 0

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Show battery percentage in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Enable Safari's debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Done! Some changes may require a logout/restart to take effect."
