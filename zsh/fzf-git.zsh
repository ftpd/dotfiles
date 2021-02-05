# heavily inspired (and sometimes stolen from): https://github.com/wfxr/forgit.git

_am_i_git_repo() { git rev-parse --is-inside-work-tree >/dev/null; }

gl() {
  _am_i_git_repo || return 1
  files=$(sed -nE 's/.* -- (.*)/\1/p' <<< "$*")
  cmd="echo {} |grep -Eo '[a-f0-9]+' |head -1 |xargs -I% git show --color=always % -- $files | cat"
	g=(git log --graph --format='%C(auto)%h%d %s %C(black)%C(bold)%cr%Creset' --color=always "$@")
	fzf=(fzf --ansi --reverse --tiebreak=index --no-sort --bind='ctrl-j:preview-up' --bind='ctrl-k:preview-down' --bind="ctrl-y:execute-silent(echo {} |grep -Eo '[a-f0-9]+' | head -1 | tr -d '\n' |pbcopy)" --bind="enter:execute($cmd | LESS='-r' less)" --preview 'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1; }; f {}')
	$g | $fzf
  return 0
}

gd() {
  _am_i_git_repo || return 1
  extract="
    sed 's/^.*]  //' |
    sed 's/.* -> //' |
    sed -e 's/^\\\"//' -e 's/\\\"\$//'"
  files=$(git -c color.status=always -c status.relativePaths=true status -su | grep -F -e "$changed" -e "$unmerged" -e "$untracked" | sed -E 's/^(..[^[:space:]]*)[[:space:]]+(.*)$/[\1]  \2/' | fzf --reverse --tiebreak=index --no-sort --bind='ctrl-j:preview-up' --bind='ctrl-k:preview-down' --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' | sh -c "$extract")
  [[ -n "$files" ]] && echo "$files"| tr '\n' '\0' |xargs -0 -I% git add % && git status -su && return
  echo 'Nothing to add.'
}
alias ga=gd
alias gs=gd
