#!/bin/sh

# cleaning & preparing
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles

# repo + preparations
git clone https://github.com/ftpd/dotfiles.git ~/.dotfiles
mkdir -p ~/.config

## vim
# cleaning
rm -rf ~/.vim* ~/.config/vim
mkdir -p ~/.config/vim/runtime
# installing
ln -sf ~/.dotfiles/vim/autoload ~/.config/vim/runtime
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc

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
rm -rf ~/.zsh* ~/.zcomp* ~/.config/zsh/
mkdir -p ~/.config/zsh/caches ~/.config/zsh/plugins ~/.config/zsh/themes
# dependiences
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/themes/powerlevel10k
# installing
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
