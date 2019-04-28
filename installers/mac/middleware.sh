#! /bin/bash

brew install mysql
brew install docker
brew install ndenv
git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build
brew cask install docker
brew install docker-compose
open /Applications/Docker.app
