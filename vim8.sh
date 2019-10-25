#!/bin/bash

set -e

sudo yum -y remove vim-enhanced
rm -rf /tmp/vim

sudo yum -y install ncurses-devel
git clone https://github.com/vim/vim.git /tmp/vim
cd /tmp/vim/src
sudo make install

vim --version | head -1
