#!/bin/sh

# cleaning
rm -rf ~/.dotfiles ~/.zsh ~/.oh-my-zsh ~/.zshrc ~/.vim ~/.vimrc ~/.config/nvim ~/.config/vim-plugins ~/.gitignore ~/.tmux.conf

# repos
if [ `whoami` = "f" ]; then
  path="git@bitbucket.org:ftpd/dotfiles.git"
else
  path="https://bitbucket.org/ftpd/dotfiles.git"
fi
git clone $path ~/.dotfiles

# zsh
mkdir ~/.zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/autosuggestions
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i -e 's/# CASE_SENSITIVE/CASE_SENSITIVE/' ~/.zshrc
if [ ! `whoami` = "root" ]; then
  echo 'export DEFAULT_USER=$LOGNAME' >> ~/.zshrc
fi
echo "zstyle ':vcs_info:*' enable git svn" >> ~/.zshrc
echo "[ -e ~/.zsh/autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "[ -e ~/.zshrc.local ] && source ~/.zshrc.local" >> ~/.zshrc
touch ~/.zshrc.local
source ~/.zshrc

# vim
mkdir -p ~/.config
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vim ~/.config/nvim
ln -sf ~/.dotfiles/vim/init.vim ~/.vimrc

# .gitignore
ln -sf ~/.dotfiles/gitignore ~/.gitignore

# tmux
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
