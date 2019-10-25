#! /bin/sh

set -e

sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y remove git git-\*

sudo yum -y install zsh git2u
chsh -s $(which zsh)
