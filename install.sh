#!/bin/sh

# cleaning
rm -rf ~/.dotfiles ~/.vim* ~/.gitignore ~/.tmux.conf ~/.config/fish

# repos
if [ `whoami` = "f" ]; then
  path="git@bitbucket.org:ftpd/dotfiles.git"
else
  path="https://bitbucket.org/ftpd/dotfiles.git"
fi
git clone $path ~/.dotfiles

# vim
mkdir -p ~/.config
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vim/init.vim ~/.vimrc

# .gitignore
ln -sf ~/.dotfiles/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# tmux
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

# fish
touch ~/.fish.local
mkdir -p ~/.config/fish/functions
ln -s ~/.dotfiles/fish/prompt_pwd.fish ~/.config/fish/functions
curl -sfL https://git.io/fundle-install | fish
echo "fundle plugin 'hauleth/agnoster'" >> ~/.config/fish/config.fish
echo "fundle init" >> ~/.config/fish/config.fish
echo 'set fish_greeting ""' >> ~/.config/fish/config.fish
if [ ! `whoami` = "root" ]; then
  echo 'set -x DEFAULT_USER $LOGNAME' >> ~/.config/fish/config.fish
fi
echo 'source ~/.fish.local' >> ~/.config/fish/config.fish
fish -c 'fundle install; agnoster powerline'
