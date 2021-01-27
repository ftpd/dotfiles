bindkey -e

autoload -U vcs_info
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit -d $XDG_DATA_HOME/zsh/zcompdump

export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=$XDG_DATA_HOME/zsh/history
export LESSHISTFILE='/dev/null'

setopt prompt_subst
setopt share_history
setopt inc_append_history

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zmodload zsh/complist

# plugins
source $ZDOTDIR/plugins/kube-ps1/kube-ps1.sh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
function virtualenv_info(){
    [[ -n "$VIRTUAL_ENV" ]] && venv="${VIRTUAL_ENV##*/}" || venv=''
    [[ -n "$venv" ]] && echo " $venv "
}

# git
zstyle ':vcs_info:*' enable git
() {
    zstyle ':vcs_info:*' stagedstr '%F{green}+'
    zstyle ':vcs_info:*' unstagedstr '%F{red}!'
    zstyle ':vcs_info:*' formats " %b %m%u%c%{$reset_color%}"
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
}
+vi-git-untracked() {
if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{red}?'
fi
}

# kubernetes
KUBE_PS1_PREFIX=''
KUBE_PS1_SUFFIX=' '
KUBE_PS1_DIVIDER='/'
KUBE_PS1_SEPARATOR=''
KUBE_PS1_NS_COLOR='blue'
KUBE_PS1_CTX_COLOR='blue'

# fzf
if [ -f $XDG_CONFIG_HOME/fzf/fzf.zsh ]; then
  source $XDG_CONFIG_HOME/fzf/fzf.zsh
  export FZF_DEFAULT_COMMAND='fd -H -L --ignore-file $XDG_CONFIG_HOME/local/fd'
  export FZF_CTRL_T_COMMAND='fd -H -L --ignore-file $XDG_CONFIG_HOME/local/fd'
  export FZF_DEFAULT_OPTS="--multi -e --ansi --layout=reverse --preview='bat --color=always --tabs=2 --style=plain --theme=Monokai\ Extended\ Bright {}'"
  export FZF_CTRL_R_OPTS="-e --ansi --layout=reverse --preview=''"
  _fzf_compgen_path() {
    fd -H -L --ignore-file $XDG_CONFIG_HOME/local/fd . "$1"
  }
  _fzf_compgen_dir() {
    fd -H -L --ignore-file $XDG_CONFIG_HOME/local/fd --type d . "$1"
  }
fi

# prompt
newline=$'\n'
precmd() { vcs_info }
if [[ -n "$SSH_CLIENT" ]]; then
  PROMPT='%{$fg_bold[default]%}$(virtualenv_info)$(kube_ps1)%{$reset_color%}${vcs_info_msg_0_}${newline}%n@%m %{$fg_bold[cyan]%}%~ %F{%(?.green.red)}❯%{$reset_color%} '
else
  PROMPT='%{$fg_bold[default]%}$(virtualenv_info)$(kube_ps1)%{$reset_color%}${vcs_info_msg_0_}${newline}%{$fg_bold[cyan]%}%~ %F{%(?.green.red)}❯%{$reset_color%} '
fi
[[ `id -u` -eq 0 ]] && PROMPT='%{$fg_bold[default]%}$(virtualenv_info)%{$reset_color%}${vcs_info_msg_0_}${newline}%{$fg_bold[red]%n@%m %{$fg_bold[cyan]%}%~ %F{%(?.green.red)}❯%{$reset_color%} '

# local addons
[ -e $XDG_CONFIG_HOME/local/zsh ] && source $XDG_CONFIG_HOME/local/zsh
