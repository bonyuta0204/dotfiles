#!/bin/bash

set -eu

# set os to MACHINE
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

# Install Essential Tools
case $MACHINE in
  "Mac")
    source installers/mac/essentials.sh
    ;;
  "Linux")
    if command -v apt > /dev/null ; then
      echo "installing package using apt..."
      source installers/apt/essentials.sh
      echo "setting up environment with ansible"
      make ansible
    else
      echo "Error: apt not found"
    fi
    ;;
  *)
    echo "Error: Unsupported machine type"
    ;;
esac

# set symlink
make deploy

# install fzf
source installers/fzf.sh

# Install and set up fish
fish installers/fish.fish

