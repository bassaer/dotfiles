#!/bin/bash

set -e

sudo yum -y remove vim-enhanced
rm -rf /tmp/vim
git clone https://github.com/vim/vim.git /tmp/vim
cd /tmp/vim/src
sudo make install
vim --version | head -1
