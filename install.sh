#!/bin/sh

# cleaning
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles
rm -rf ~/.cache ~/.config/_cache ~/.config/fd ~/.config/git/ignore ~/.config/nvim ~/.config/tmux ~/.config/vim ~/.config/zsh ~/.local ~/.zshenv
rm -rf ~/.fdignore ~/.fzf.bash ~/.fzf.zsh ~/.gitconfig ~/.gitignore ~/.history ~/.tmux.conf ~/.vim* ~/.zcomp* ~/.zsh*

# repo + preparations
git clone --recurse https://github.com/ftpd/dotfiles.git ~/.dotfiles
mkdir -p ~/.config/_cache/zsh ~/.config/git ~/.config/local

## neovim
ln -sf ~/.dotfiles/nvim ~/.config/
touch ~/.config/local/init.vim

## .gitignore
ln -sf ~/.dotfiles/git/ignore ~/.config/git/ignore

## fdignore
ln -sf ~/.dotfiles/fd ~/.config/

## tmux
ln -sf ~/.dotfiles/tmux ~/.config/

## zsh
echo "skip_global_compinit=1" > ~/.zshenv
echo "export XDG_DATA_HOME=~/.config/_cache" > ~/.zshenv
echo "export XDG_CACHE_HOME=~/.config/_cache" >> ~/.zshenv
echo "export XDG_CONFIG_HOME=~/.config" >> ~/.zshenv
echo "export ZDOTDIR=~/.config/zsh" >> ~/.zshenv
ln -sf ~/.dotfiles/zsh ~/.config/
