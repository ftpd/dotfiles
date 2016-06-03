#!/bin/sh

# cleaning
rm -rf ~/.dotfiles ~/.oh-my-zsh ~/.zshrc ~/.vim ~/.vimrc ~/.gvimrc ~/.gitignore ~/.tmux.conf

# repos
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
if [ `whoami` = "f" ] || [ `whoami` = "ftpd" ] || [ `whoami` = "bartek.stalewski" ]; then
  path="git@bitbucket.org:ftpd/dotfiles.git"
else
  path="https://bitbucket.org/ftpd/dotfiles.git"
fi
git clone $path ~/.dotfiles
cd ~/.dotfiles
rm -rf ~/.vim/bundle/*
git submodule init
git submodule update
cd vim/bundle/nerdtree
git checkout master
cd ~/.dotfiles
#cd dircolors
#git checkout master

# files

## zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i -e 's/# CASE_SENSITIVE/CASE_SENSITIVE/' ~/.zshrc
echo 'export DEFAULT_USER=$LOGNAME' >> ~/.zshrc
echo "zstyle ':vcs_info:*' enable hg bzr git svn" >> ~/.zshrc
echo "[ -e ~/.zshrc.local ] && source ~/.zshrc.local" >> ~/.zshrc
source ~/.zshrc

# vim
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.vim/rcfiles/vimrc ~/.vimrc
ln -sf ~/.vim/rcfiles/gvimrc ~/.gvimrc

# .gitignore
ln -sf ~/.dotfiles/gitignore ~/.gitignore

# tmux
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
