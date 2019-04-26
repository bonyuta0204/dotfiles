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
 echo 'mac'
 source installers/mac/install.sh
fi
