git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
 ENABLE_CORRECTION="true"
plugins=(git kube-ps1 command-time zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export DEFAULT_USER=$LOGNAME
source ~/.dotfiles/zsh/abbr_pwd
prompt_dir() {
  prompt_segment blue $CURRENT_FG $(felix_pwd_abbr)
}
PROMPT=$PROMPT'$(kube_ps1) '
ZSH_COMMAND_TIME_MIN_SECONDS=2
ZSH_COMMAND_TIME_MSG="(took $fg[yellow]%s$fg[default])"
[ -e ~/.zshrc.local ] && source ~/.zshrc.local
