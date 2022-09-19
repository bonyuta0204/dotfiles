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

# when apt is available
if command -v apt > /dev/null ; then
  echo "installing package using apt..."
  source installers/apt/essentials.sh
  echo "setting up environment with ansible"
  make ansible
fi

# set symlink
make deploy

# install fzf
source installers/fzf.sh
