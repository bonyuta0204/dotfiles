#!/bin/bash
set -ex
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt-install(){
 apt-get -y install $@
}

apt-add-repo(){
  apt-add-repository -y $@
}
apt-get update
## apt-add-repo is included in software-properties-common
apt-install software-properties-common

apt-add-repo ppa:ansible/ansible

apt-install build-essential
apt-install ansible

