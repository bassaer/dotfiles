#! /bin/sh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

git clone https://github.com/bassaer/dotfiles.git

for f in $(ls -a -1 -F dotfiles/zsh | grep -v /)
do
  cp "dotfiles/zsh/$f" ~/$f
done

cd ~/.zprezto; git apply ~/dotfiles/zsh/prezto/prezto.patch

cp dotfiles/vim/.vimrc ~/.vimrc
cp -r dotfiles/vim/.vim/ ~/
sh dotfiles/vim/install.sh

wget https://github.com/peco/peco/releases/download/v0.2.9/peco_linux_amd64.tar.gz

sudo tar -C /usr/local/bin/ -xzf peco_linux_amd64.tar.gz

exec zsh -l
