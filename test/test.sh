#!/bin/bash


# This script is used to test if the setup was successful.

# ANSI escape codes for text color
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"
BOLD="\033[1m"

FAILED=0

# Function to display program check result
display_result() {
    local cmd=$1
    local is_installed=$2
    local VERSION=$3

    echo -n "📝 $cmd: "
    if [ "$is_installed" -eq 0 ]
    then
        if [ -z "$VERSION" ]
        then
            echo -e "${RED}⚠️ Installed but version not detected${RESET}"
        else
            echo -e "${GREEN}✅ Succesfully installed (version: ${VERSION})${RESET}"
        fi
    else
        echo -e "${RED}❌ Not Installed${RESET}"
        FAILED=1
    fi
}

## Test programs are correctly installed

echo -e "${BOLD}🔍 Checking program installation...${RESET}"

# vim
is_installed=$(command -v vim &> /dev/null; echo $?)
VERSION=$( [ "$is_installed" -eq 0 ] && vim --version | head -n 1 | cut -d ' ' -f 5 )
display_result "vim" "$is_installed" "$VERSION"

# neovim
is_installed=$(command -v nvim &> /dev/null; echo $?)
VERSION=$( [ "$is_installed" -eq 0 ] && nvim --version | head -n 1 | awk '{print $2}')
display_result "neovim" "$is_installed" "$VERSION"

# tmux
is_installed=$(command -v tmux &> /dev/null; echo $?)
VERSION=$( [ "$is_installed" -eq 0 ] && tmux -V | awk '{print $2}')
display_result "tmux" "$is_installed" "$VERSION"

# fish
is_installed=$(command -v fish &> /dev/null; echo $?)
VERSION=$( [ "$is_installed" -eq 0 ] && fish --version | awk '{print $3}')
display_result "fish" "$is_installed" "$VERSION"

## Testing fish installation

echo ""
echo -e "${BOLD}🔍 Checking fish installation...${RESET}"

fish test/test_fish.fish

if [ $? -ne 0 ]
then
    FAILED=1
fi

exit $FAILED

