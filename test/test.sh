#!/bin/bash

# This script is used to test if the setup was successful.

# ANSI escape codes for text color
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"
BOLD="\033[1m"

FAILED=0

## Test programs are correctly installed

echo -e "${BOLD}🔍 Checking program installation...${RESET}"

### vim
echo -n "📝 vim: "
if ! command -v vim &> /dev/null
then
    echo -e "${RED}❌ Not Installed${RESET}"
    FAILED=1
else
    VERSION=$(vim --version | head -n 1 | cut -d ' ' -f 5)
    echo -e "${GREEN}✅ OK. Installed version ${VERSION}${RESET}"
fi

echo -n "📝 neovim: "
if ! command -v nvim &> /dev/null
then
    echo -e "${RED}❌ Not Installed${RESET}"
    FAILED=1
else
    VERSION=$(nvim --version | head -n 1 | awk '{print $2}')
    echo -e "${GREEN}✅ OK. Installed version ${VERSION}${RESET}"
fi

echo -n "📝 tmux: "
if ! command -v tmux &> /dev/null
then
    echo -e "${RED}❌ Not Installed${RESET}"
    FAILED=1
else
    VERSION=$(tmux -V | awk '{print $2}')
    echo -e "${GREEN}✅ OK. Installed version ${VERSION}${RESET}"
fi

echo -n "📝 fish: "
if ! command -v fish &> /dev/null
then
    echo -e "${RED}❌ Not Installed${RESET}"
    FAILED=1
else
    VERSION=$(fish --version | awk '{print $3}')
    echo -e "${GREEN}✅ OK. Installed version ${VERSION}${RESET}"
fi


exit $FAILED