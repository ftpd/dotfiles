#!/bin/sh

# cleaning
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles

# repo
git clone https://bitbucket.org/ftpd/dotfiles.git ~/.dotfiles

## vim
# cleaning
rm -rf ~/.vim*
rm -rf ~/.config/nvim
# installing
mkdir -p ~/.config
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vim/init.vim ~/.vimrc

## .gitignore
# cleaning
rm -rf ~/.gitignore
# installing
ln -sf ~/.dotfiles/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

## tmux
# cleaning
rm -rf ~/.tmux.conf
# installing
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

## zsh
# cleaning
rm -rf ~/.zsh* ~/.oh-my-zsh
# installing
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
git clone --recursive https://github.com/mengelbrecht/slimline.git ~/.oh-my-zsh/custom/themes/slimline
cp ~/.dotfiles/zsh/zshrc ~/.zshrc
touch ~/.zshrc.local
source ~/.zshrc
