# key mode
bindkey -e

# global exports and options
setopt share_history
setopt inc_append_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=$XDG_DATA_HOME/zsh/history
export LESSHISTFILE='/dev/null'

autoload -U compinit && compinit -d $XDG_DATA_HOME/zsh/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

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
  gs() {
    git -c color.status=always status --short |
    fzf --ansi --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})'
  }
fi

# plugins
source $ZDOTDIR/modules/forgit.plugin.zsh
source $ZDOTDIR/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# theme
source $ZDOTDIR/p10k.zsh
source $ZDOTDIR/modules/powerlevel10k/powerlevel10k.zsh-theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# local addons
[ -e $XDG_CONFIG_HOME/local/zsh ] && source $XDG_CONFIG_HOME/local/zsh
