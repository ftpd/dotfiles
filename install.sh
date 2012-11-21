#!/bin/sh

# cleaning
rm -rf ~/.dotfiles ~/.oh-my-zsh ~/.zshrc ~/.vim ~/.vimrc ~/.gvimrc ~/.gitignore

# zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i -e 's/robbyrussell/nicoulaj/' ~/.zshrc
echo "[ -e ~/.zshrc.local ] && source ~/.zshrc.local" >> ~/.zshrc

# ftpd/doftiles
path="https://ftpd@bitbucket.org/ftpd/dotfiles.git"

if [ `hostname` = "tuonela.local" ] && [ `whoami` = "ftpd" ]; then
	path="git@bitbucket.org:ftpd/dotfiles.git"
fi
git clone $path .dotfiles

# vim
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.vim/rcfiles/vimrc ~/.vimrc
ln -sf ~/.vim/rcfiles/gvimrc ~/.gvimrc
rm -rf ~/.vim/bundle/*
git clone git://github.com/Lokaltog/vim-powerline.git ~/.vim/bundle/powerline
git clone git://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# .gitignore
ln -sf ~/.dotfiles/gitignore ~/.gitignore
