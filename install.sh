#! /bin/sh

set -e
sudo yum -y install zsh git
chsh -s $(which zsh)
