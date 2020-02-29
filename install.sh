#!/bin/bash

# set os to MACHINE
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

if [[ $MACHINE == "Mac" ]]; then
 source installers/mac/essentials.sh
fi

if command -v apt > /dev/null ; then
  echo "installing package using apt..."
  source installers/apt/essentials.sh
fi

# set symlink
make deploy

vim -c "call dein#install()" -c "quit"
nvim -c "call dein#install()" -c "quit"


# install fzf
source installers/fzf.sh
