#!/bin/sh

# cleaning
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles

# repos
if [ `whoami` = "f" ]; then
  path="git@bitbucket.org:ftpd/dotfiles.git"
else
  path="https://bitbucket.org/ftpd/dotfiles.git"
fi
git clone $path ~/.dotfiles

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
ln -sf ~/.dotfiles/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

## tmux
# cleaning
rm -rf ~/.tmux.conf
# installing
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

## fish
# cleaning
rm -rf ~/.config/fish ~/.local/share/fish ~/.config/omf ~/.local/share/omf
# installing omf
curl -L http://get.oh-my.fish | fish
fish -c 'omf install bobthefish'
# installing misc settings
touch ~/.fish.local
echo 'set -g theme_title_use_abbreviated_path no' > ~/.config/fish/config.fish
if [ `hostname` != 'tuonela' ]; then
  echo 'set -g theme_display_user yes' >> ~/.config/fish/config.fish
fi
echo 'source ~/.fish.local' >> ~/.config/fish/config.fish
