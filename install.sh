#!/bin/sh

# cleaning
rm -rf ~/.dotfiles ~/.config/fish ~/.local/share/omf ~/.vim ~/.vimrc ~/.config/nvim ~/.config/vim-plugins ~/.gitignore ~/.tmux.conf

# repos
if [ `whoami` = "f" ]; then
  path="git@bitbucket.org:ftpd/dotfiles.git"
else
  path="https://bitbucket.org/ftpd/dotfiles.git"
fi
git clone $path ~/.dotfiles

# fish
touch ~/.fish.local
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf install agnoster
omf theme agnoster
echo 'set fish_greeting ""' >> ~/.config/fish/config.fish
echo 'source ~/.fish.local' >> ~/.config/fish/config.fish

# vim
mkdir -p ~/.config
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vim ~/.config/nvim
ln -sf ~/.dotfiles/vim/init.vim ~/.vimrc

# .gitignore
ln -sf ~/.dotfiles/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# tmux
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
