#!/bin/sh

# cleaning
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles

# repo
git clone https://bitbucket.org/ftpd/dotfiles.git ~/.dotfiles

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
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > ~/install.omf
fish ~/install.omf --noninteractive
fish -c 'omf install bobthefish'
rm -rf ~/install.omf
# installing misc settings
mkdir -p ~/.config/fish/functions
echo 'function fish_greeting; end' > ~/.config/fish/functions/fish_greeting.fish
echo 'function fish_right_prompt; end' > ~/.config/fish/functions/fish_right_prompt.fish
touch ~/.fish.local
echo 'set -x VIRTUAL_ENV_DISABLE_PROMPT 1' > ~/.config/fish/config.fish
echo 'set -g theme_title_use_abbreviated_path no' >> ~/.config/fish/config.fish
echo 'set -g fish_prompt_pwd_dir_length 0' >> ~/.config/fish/config.fish
echo 'set -g theme_display_user yes' >> ~/.config/fish/config.fish
echo 'source ~/.fish.local' >> ~/.config/fish/config.fish
touch ~/.hushlogin
