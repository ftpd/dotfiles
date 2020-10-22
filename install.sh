#!/bin/sh

# cleaning
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles
rm -rf ~/.config/fd ~/.config/git ~/.config/nvim ~/.config/tmux ~/.config/zsh ~/.zshrc
rm -rf ~/.fdignore ~/.fzf.bash ~/.fzf.zsh ~/.gitconfig ~/.gitignore ~/.history ~/.tmux.conf ~/.zcomp* ~/.zsh*

# repo + preparations
git clone https://github.com/ftpd/dotfiles.git ~/.dotfiles
mkdir -p ~/.cache ~/.config/local ~/.config/nvim ~/.config/zsh

## neovim
mkdir -p ~/.config/nvim/runtime
ln -sf ~/.dotfiles/nvim/autoload ~/.config/nvim/runtime
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

## .gitignore
ln -sf ~/.dotfiles/git ~/.config/

## fdignore
ln -sf ~/.dotfiles/fd ~/.config/

## tmux
ln -sf ~/.dotfiles/tmux ~/.config/

## zsh
mkdir -p ~/.cache/zsh ~/.config/zsh/caches ~/.config/zsh/plugins ~/.config/zsh/themes
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/themes/powerlevel10k
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
