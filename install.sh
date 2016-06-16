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
curl -L https://github.com/oh-my-fish/theme-agnoster/raw/master/fish_prompt.fish > .config/fish/functions/fish_prompt.fish
echo 'set fish_greeting ""' >> ~/.config/fish/config.fish
echo 'source ~/.fish.local' >> ~/.config/fish/config.fish
