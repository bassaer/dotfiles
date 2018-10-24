#!/bin/bash
sudo yum -y remove vim-enhanced
cd vim/src
make
sudo make install
vim --version | head -n 1
