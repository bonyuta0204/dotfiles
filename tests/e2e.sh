#! /bin/bash
set -ue

source "$(dirname "$0")/../lib/util.sh"

PLATFORM=$(get_platform)

# Determine the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run the install script
"${SCRIPT_DIR}/../install" -a

# set environment variable for homebrew
if [[ $PLATFORM == "macos" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ $PLATFORM == "linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "ERROR: unknown platform" >&2
    exit 1
fi

# verify homebrew install
if ! command_exists "brew"; then
    echo "Homebrew is not installed." >&2
    exit 1
fi

# install tools for testing
brew install fish git vim neovim tmux starship

if [[ $PLATFORM == "macos" ]]; then
  brew install visual-studio-code
fi

# Run the setup script
"${SCRIPT_DIR}/../setup" -a

# Collect errors
errors=()

# test bash setup
if [ -f ~/.bashrc ]; then
    echo "bashrc exists"
else
    echo "bashrc does not exist" >&2
    errors+=("bashrc")
fi

if [ -f ~/.bash_profile ]; then
    echo "bash_profile exists"
else
    echo "bash_profile does not exist" >&2
    errors+=("bash_profile")
fi

# test fish setup
if [ -f ~/.config/fish/config.fish ]; then
    echo "fish config exists"
else
    echo "fish config does not exist" >&2
    errors+=("fish config")
fi

# test git setup
if [ -f ~/.gitconfig ]; then
    echo "gitconfig exists"
else
    echo "gitconfig does not exist" >&2
    errors+=("gitconfig")
fi

# test vim setup
if [ -f ~/.vimrc ]; then
    echo "vimrc exists"
else
    echo "vimrc does not exist" >&2
    errors+=("vimrc")
fi

# test nvim setup
if [ -d ~/.config/nvim ]; then
    echo "nvim config exists"
else
    echo "nvim config does not exist" >&2
    errors+=("nvim config")
fi

# test tmux setup
if [ -f ~/.tmux.conf ]; then
    echo "tmux config exists"
else
    echo "tmux config does not exist" >&2
    errors+=("tmux config")
fi

# test starship setup
if [ -f ~/.config/starship.toml ]; then
    echo "starship config exists"
else
    echo "starship config does not exist" >&2
    errors+=("starship config")
fi

# test vscode setup (macOS only)
if [[ $PLATFORM == "macos" ]]; then
    if [ -d "/Applications/Visual Studio Code.app" ]; then
        echo "vscode is installed"
    else
        echo "vscode is not installed" >&2
        errors+=("vscode")
    fi
fi

# Report errors
if [ ${#errors[@]} -gt 0 ]; then
    echo "The following setups failed:" >&2
    for error in "${errors[@]}"; do
        echo "- $error" >&2
    done
    exit 1
else
    echo "All tests passed successfully!"
fi
