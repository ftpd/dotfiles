#!/bin/sh

# cleaning
rm -rf ~/.dotfiles ~/.oh-my-zsh ~/.zshrc ~/.vim ~/.vimrc ~/.gvimrc ~/.gitignore ~/.tmux.conf

# zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i -e 's/robbyrussell/nicoulaj/' ~/.zshrc
sed -i -e 's/# CASE_SENSITIVE/CASE_SENSITIVE/' ~/.zshrc
echo "eval $( dircolors -b ~/.dotfiles/dircolors ) " >> ~/.zshrc
echo "zstyle ':vcs_info:*' enable hg bzr git svn" >> ~/.zshrc
echo "[ -e ~/.zshrc.local ] && source ~/.zshrc.local" >> ~/.zshrc

# ftpd/doftiles
path="https://bitbucket.org/ftpd/dotfiles.git"

if [ `hostname` = "tuonela" ] && [ `whoami` = "bartek.stalewski" ]; then
	path="git@bitbucket.org:ftpd/dotfiles.git"
fi
git clone $path ~/.dotfiles

# vim
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.vim/rcfiles/vimrc ~/.vimrc
ln -sf ~/.vim/rcfiles/gvimrc ~/.gvimrc
rm -rf ~/.vim/bundle/*
#git submodule add git://github.com/Lokaltog/vim-powerline.git vim/bundle/powerline
#git submodule add git://github.com/scrooloose/nerdtree.git vim/bundle/nerdtree
cd ~/.dotfiles
git submodule init
git submodule update
cd vim/bundle/powerline
git checkout -b develop origin/develop

# .gitignore
ln -sf ~/.dotfiles/gitignore ~/.gitignore

# tmux
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
