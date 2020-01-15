#git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
plugins=(git kube-ps1 timer zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export DEFAULT_USER=$LOGNAME
source ~/.dotfiles/zsh/abbr_pwd
prompt_dir() {
  prompt_segment blue $CURRENT_FG $(felix_pwd_abbr)
}
PROMPT=$PROMPT'$(kube_ps1) '
