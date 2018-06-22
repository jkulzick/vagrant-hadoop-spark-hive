#!/bin/bash

set -e -x

# update homebrew
brew update

# install brew cask
brew tap caskroom/cask

# install virtualbox and vagrant
brew cask install virtualbox
brew cask install vagrant

# add centos/7 box to vagrant
VAGRANT_BOXES=$(vagrant box list)
if [[ $VAGRANT_BOXES != "centos/7"*"virtualbox"* ]]; then
    vagrant box add centos/7 --provider virtualbox
fi