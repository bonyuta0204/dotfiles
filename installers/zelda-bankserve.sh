#! /bin/bash

ALLSTAR_DIR="$HOME/zelda-allstars"
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

if [[ ! -d $ALLSTAR_DIR/zelda-bankserve ]];then
  git clone git@github.com:f-scratch/zelda-bankserve.git $ALLSTAR_DIR/zelda-bankserve
fi

cd $ALLSTAR_DIR/zelda-bankserve
if [ ! -f config/settings.local.yml ]; then
  echo 'setting up settings.local.yml'
  cp config/settings.local.sample.yml config/settings.local.yml
fi

# install ruby 2.6.1 with rbenb
if ! rbenv versions | grep "2.6.1"; then
 echo 'setting up ruby 2.6.1'
 rbenv init
 rbenv install 2.6.1
 rbenv rehash
 rbenv local 2.6.1
 gem install bundler
fi

if ! ndenv versions | grep "10.13.0"; then
 echo 'setting up node,js 10.13.0'
 ndenv init
 ndenv install v10.13.0
 ndenv rehash
 ndenv local v10.13.0
 brew install yarn
fi

yarn install

# setup bundle config
bundle config build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
brew install v8-315
bundle config  build.libv8 --with-system-v8
bundle config build.therubyracer --with-v8-dir=$(brew --prefix v8-315)

bundle install --path=vendor/bundle

bundle exec rake db:create
bundle exec rake ridgepole:apply
