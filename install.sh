#!/bin/sh

# cleaning
rm -rf ~/.dotfiles ~/.oh-my-zsh ~/.zshrc ~/.vim ~/.vimrc ~/.gvimrc ~/.gitignore ~/.tmux.conf

# repos
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
if [ `hostname` = "tuonela" ] && [ `whoami` = "bartek.stalewski" ]; then
  path="git@bitbucket.org:ftpd/dotfiles.git"
else
  path="https://bitbucket.org/ftpd/dotfiles.git"
fi
git clone $path ~/.dotfiles
cd ~/.dotfiles
git submodule init
git submodule update
cd vim/bundle/powerline
git checkout -b develop origin/develop

# files

## zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i -e 's/robbyrussell/nicoulaj/' ~/.zshrc
sed -i -e 's/# CASE_SENSITIVE/CASE_SENSITIVE/' ~/.zshrc
case `uname` in
  Linux) echo 'eval $( dircolors -b ~/.dotfiles/dircolors/dircolors.ansi-universal ) ' >> ~/.zshrc ;;
  Darwin) echo 'eval $( gdircolors -b ~/.dotfiles/dircolors/dircolors.ansi-universal ) ' >> ~/.zshrc ;;
esac
echo "zstyle ':vcs_info:*' enable hg bzr git svn" >> ~/.zshrc
echo "[ -e ~/.zshrc.local ] && source ~/.zshrc.local" >> ~/.zshrc

# vim
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.vim/rcfiles/vimrc ~/.vimrc
ln -sf ~/.vim/rcfiles/gvimrc ~/.gvimrc
rm -rf ~/.vim/bundle/*

# .gitignore
ln -sf ~/.dotfiles/gitignore ~/.gitignore

# tmux
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
