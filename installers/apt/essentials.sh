#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt-install(){
 apt-get -y install $@
}

apt-add-repo(){
  apt-add-repository $@
}


apt-add-repo ppa:fish-shell/release-3
apt-add-repo ppa:neovim-ppa/stable

apt-get update

apt-install git
apt-install build-essential
apt-install neovim
apt-install fish
apt-install python-neovim
apt-install python3-neovim
apt-install tig
apt-install python3-pip
