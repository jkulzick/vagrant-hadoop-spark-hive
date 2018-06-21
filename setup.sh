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
vagrant box add centos/7 --provider virtualbox