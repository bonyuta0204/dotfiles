if ! command -v ansible > /dev/null;then
  apt update
  apt install -y software-properties-common
  apt install -y build-essential
  add-apt-repository --yes --update ppa:ansible/ansible
  apt install -y ansible
fi
