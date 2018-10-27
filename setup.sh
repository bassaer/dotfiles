#! /bin/sh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

git clone https://github.com/bassaer/dotfiles.git

for f in $(ls -a -1 -F dotfiles/zsh | grep -v /)
do
  cp "dotfiles/zsh/$f" ~/$f
done

patch -uR ~/.zprezto/runcoms/zpreztorc < ~/dotfiles/zsh/zprezto/zpreztorc.patch
patch -uR ~/.zprezto/modules/prompt/external/pure/pure.zsh < ~/dotfiles/zsh/zprezto/pure.patch

cp ~/dotfiles/vim/.vimrc ~/.vimrc
cp -r ~/dotfiles/vim/.vim/ ~/
sh ~/dotfiles/vim/install.sh

cd

wget https://github.com/peco/peco/releases/download/v0.2.9/peco_linux_amd64.tar.gz

tar -xzf peco_linux_amd64.tar.gz

exec zsh -l
