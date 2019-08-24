
printf "password: "
read PASSWORD


apt-install(){
  echo $@
  echo $PASSWORD | sudo -S apt-get -y install $@
}

sudo-apt(){
  echo $PASSWORD | sudo -S apt $@
}

sudo-apt update

apt-install build-essential
apt-install neovim
apt-install python-neovim
apt-install python3-neovim
apt-install tig
