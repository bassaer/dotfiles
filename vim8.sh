#!/bin/bash
sudo yum -y remove vim-enhanced
rm -rf vim
git clone https://github.com/vim/vim.git
cd vim/src
make
sudo make install
vim --version | head -n 1
