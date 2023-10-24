#!/bin/bash
set -eu

# Set environment variables to non-interactive (this prevents some prompts)
export DEBIAN_FRONTEND=non-interactive

apt-install(){
 sudo apt-get -y install $@
}

apt-add-repo(){
  sudo apt-add-repository -y $@
}
sudo apt-get update
## apt-add-repo is included in software-properties-common
apt-install software-properties-common

apt-add-repo ppa:ansible/ansible

apt-install build-essential
apt-install ansible
apt-install git

