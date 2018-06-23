#! /bin/sh

sudo yum -y install zsh git

chsh -s /bin/zsh

zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

git clone https://github.com/bassaer/dotfiles.git

for f in $(ls -a -1 -F dotfiles/zsh | grep -v /)
do
  cp "dotfiles/zsh/$f" ~/$f
done

wget https://github.com/peco/peco/releases/download/v0.2.9/peco_linux_amd64.tar.gz

sudo tar -C /usr/local/bin/ -xzf peco_linux_amd64.tar.gz

exec zsh -l
