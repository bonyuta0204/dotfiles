#!/bin/bash
printf "password: "
read PASSWORD

sudo-cmd(){
  echo $PASSWORD | sudo -S $@
}


apt-install(){
  sudo-cmd apt-get -y install $@
}

apt-add-repo(){
  sudo-cmd apt-add-repository $@
}


apt-add-repo ppa:fish-shell/release-3
apt-add-repo ppa:neovim-ppa/stable

sudo-cmd apt-get update

apt-install build-essential
apt-install neovim
apt-install fish
apt-install python-neovim
apt-install python3-neovim
apt-install tig
apt-install python3-pip
