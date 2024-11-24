#!/bin/bash

PLATFORM=$(get_platform)

if ! command -v brew > /dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH
    if [[ $PLATFORM == "macos" ]]; then
        # macOS
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    elif [[ $PLATFORM == "linux" ]]; then
        # Linux 
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    else
        echo "ERROR: unknown platform"
    fi
fi
