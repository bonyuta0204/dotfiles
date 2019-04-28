#! /bin/bash

ALLSTAR_DIR="$HOME/zelda-allstars"
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

if [[ ! -d $ALLSTAR_DIR/zelda-bank ]];then
  git clone git@github.com:f-scratch/zelda-bank.git $ALLSTAR_DIR/zelda-bank
fi

cd $ALLSTAR_DIR/zelda-bank
if [ ! -f config/settings.local.yml ]; then
  echo 'setting up settings.local.yml'
  cp config/settings.local.sample.yml config/settings.local.yml
fi

# setup node,js and yarn
ndenv install v10.13.0
ndenv rehash
ndenv local v10.13.0
brew install yarn

# setup bundle config
bundle config build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
brew install v8-315
bundle config  build.libv8 --with-system-v8
bundle config build.therubyracer --with-v8-dir=$(brew --prefix v8-315)

bundle install --path=vendor/bundle

bundle exec rake db:create
bundle exec rake ridgepole:apply
bundle exec rake account_record:provision[1,1,1]
