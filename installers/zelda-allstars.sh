#! /bin/bash

ALLSTAR_DIR="$HOME/zelda-allstars"
SCRIPT_DIR=$(pwd)

# set os to MACHINE
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

# install middleware
if [[ $MACHINE == "Mac" ]]; then
 source mac/middleware.sh
fi

# install rbenv
if [[ $MACHINE == "Mac" ]]; then
 source mac/rbenv.sh
 if ! rbenv versions | grep "2.3.1"; then
   echo 'setting up ruby 2.3.1'
   rbenv init
   rbenv install 2.3.1
   rbenv rehash
   rbenv global 2.3.1
   gem install bundler
  fi
fi
# setup bundle config 
bundle config build.mysql2 --with-opt-lib=/usr/local/opt/openssl/lib --with-opt-include=-I/usr/local/opt/openssl/include

# Cloning Repository
if [ ! -d $ALLSTAR_DIR ]; then
  git clone git@github.com:f-scratch/zelda-allstars.git $ALLSTAR_DIR
fi

cd $ALLSTAR_DIR
git submodule update --init --recursive

# start middleware
open /Applications/Docker.app
docker-compose up -d

# setting up zelda-platform
echo 'setting up zelda-platform...'
cd $ALLSTAR_DIR/zelda-platform
if [ ! -f config/settings.local.yml ]; then
  echo 'setting up settings.local.yml'
  cp config/settings.local.sample.yml config/settings.local.yml
fi
bundle install --path=vendor/bundle
bundle exec rake db:create
bundle exec rake ridgepole:apply
bundle exec rake db:seed
bundle exec rake account_record:provision[1,1,1]
bundle exec rake account_record:provision[2,2,1]
bundle exec rake account_record:provision[3,3,1]

cd $SCRIPT_DIR
