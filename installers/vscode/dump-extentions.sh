#!/usr/bin/env bash

set -euo pipefail

# Determine the directory where the script resides
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Path to the file where the extensions will be dumped
DUMP_FILE="$SCRIPT_DIR/VSCodeExtensions"

# Function to append extensions to a temporary file
dump_extensions() {
    local dump_command=$1
    local temp_file=$2
    echo "Appending extensions from $dump_command to $temp_file..."
    $dump_command --list-extensions >> "$temp_file"
}

# Temporary file to store extension lists
TEMP_FILE="$(mktemp)"

# Check and dump extensions from 'code' and 'code-insider'
if command -v code >/dev/null 2>&1; then
    dump_extensions "code" "$TEMP_FILE"
fi
if command -v code-insider >/dev/null 2>&1; then
    dump_extensions "code-insider" "$TEMP_FILE"
fi

# Sort and remove duplicates, then save to final file
sort -u "$TEMP_FILE" > "$DUMP_FILE"
rm "$TEMP_FILE"

echo "Extensions successfully dumped to $DUMP_FILE."