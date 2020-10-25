#!/bin/sh

# cleaning
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles
rm -rf ~/.config/fd ~/.config/git/ignore ~/.config/nvim ~/.config/tmux ~/.config/vim ~/.config/zsh ~/.local
rm -rf ~/.fdignore ~/.fzf.bash ~/.fzf.zsh ~/.gitconfig ~/.gitignore ~/.history ~/.tmux.conf ~/.vim* ~/.zcomp* ~/.zsh*

# repo + preparations
git clone https://github.com/ftpd/dotfiles.git ~/.dotfiles
mkdir -p ~/.cache ~/.config/git ~/.config/local ~/.config/zsh

## neovim
ln -sf ~/.dotfiles/nvim ~/.config/

## .gitignore
ln -sf ~/.dotfiles/git/ignore ~/.config/git/ignore

## fdignore
ln -sf ~/.dotfiles/fd ~/.config/

## tmux
ln -sf ~/.dotfiles/tmux ~/.config/

## zsh
echo "skip_global_compinit=1" > ~/.zshenv
echo "export XDG_CONFIG_HOME=~/.config" >> ~/.zshenv
echo "export XDG_DATA_HOME=~/.cache" >> ~/.zshenv
echo "export ZDOTDIR=~/.config/zsh" >> ~/.zshenv
mkdir -p ~/.cache/zsh ~/.config/zsh/plugins ~/.config/zsh/themes
git clone https://github.com/Aloxaf/fzf-tab ~/.config/zsh/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/themes/powerlevel10k
ln -sf ~/.dotfiles/zsh/zshrc ~/.config/zsh/.zshrc
