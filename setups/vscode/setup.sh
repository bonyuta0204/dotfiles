#!/bin/bash

make all

set -euo pipefail

# Determine the directory where the script resides
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Path to the file with extension names, relative to the script's location
EXTENSION_FILE="$SCRIPT_DIR/VSCodeExtensions"

# Check if the file exists and is readable
if [[ ! -f "$EXTENSION_FILE" ]]; then
    echo "Extension file not found: $EXTENSION_FILE" >&2
    exit 1
fi

# Function to get currently installed extensions
get_installed_extensions() {
    local list_command=$1
    $list_command --list-extensions
}

# Function to install extensions using a given command
install_extensions() {
    local install_command=$1
    local installed_extensions=$2
    echo "Installing extensions using $install_command..."

    while IFS= read -r ext; do
        if ! grep -q "^$ext\$" <<< "$installed_extensions"; then
            echo "Installing $ext..."
            $install_command --install-extension "$ext"
        fi
    done < "$EXTENSION_FILE"
}

# Install extensions using 'code' if it exists
if command -v code >/dev/null 2>&1; then
    INSTALLED_EXTENSIONS_CODE=$(get_installed_extensions "code")
    install_extensions "code" "$INSTALLED_EXTENSIONS_CODE"
fi

# Install extensions using 'code-insider' if it exists
if command -v code-insiders >/dev/null 2>&1; then
    echo "Installing extensions using code-insider..."
    INSTALLED_EXTENSIONS_CODE_INSIDER=$(get_installed_extensions "code-insiders")
    install_extensions "code-insiders" "$INSTALLED_EXTENSIONS_CODE_INSIDER"
fi

echo "Extension installation process completed."


