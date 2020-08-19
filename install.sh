#!/bin/sh

# cleaning & preparing
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles

# repo
git clone https://github.com/ftpd/dotfiles.git ~/.dotfiles

## vim
# cleaning
rm -rf ~/.vim*
# installing
mkdir -p ~/.config
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vim/init.vim ~/.vimrc

## .gitignore
# cleaning
rm -rf ~/.gitignore
# installing
ln -sf ~/.dotfiles/conf/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

## .fdignore
# cleaning
rm -rf ~/.fdignore
# installing
ln -sf ~/.dotfiles/conf/fdignore ~/.fdignore

## tmux
# cleaning
rm -rf ~/.tmux.conf
# installing
ln -sf ~/.dotfiles/conf/tmux.conf ~/.tmux.conf

## zsh
# cleaning
rm -rf ~/.zsh ~/.zshrc
mkdir -p ~/.zsh/plugins
# dependiences
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
# installing
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/.dotfiles/conf/starship.toml ~/.config
touch ~/.zshrc.local
