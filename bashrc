CYAN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
MAGENTA="\[\e[1;35m\]"
GREEN="\[\e[1;36m\]"
GRAY="\[\e[0;37m\]"

UNAME=$(uname)

export EDITOR="vim"
export PS1="$GRAY$YELLOW\u$GRAY@$CYAN\h $YELLOW\w$MAGENTA\$(git branch 2>&1 | sed -nE -e 's/^\*(.*)\$/\1/p')$GRAY\n# "
export TERM="xterm-256color"

alias be="bundle exec"
alias less="less -R"
if [ "$UNAME" = "Linux" ]; then
  alias ls="ls --color"
else
  alias ls="ls -G"
fi
alias rtest="bundle exec ruby -Itest -Ispec"
alias brake="bundle exec rake"

alias gitsha="git rev-parse HEAD | pbcopy"
alias glf="git log --pretty=full"
alias gls='git log --graph --decorate --oneline'
alias gc='git commit -v'
alias gd="git diff"
alias ga='git add'
alias gap='git add -N . && git add -p'
alias gdc="git diff --cached"
alias gs="git status"
alias gsd="git diff --stat --summary"
alias g,="git add ."
alias g.="git commit -a -v"
alias gstandup="git log --since=yesterday --before=today --author=$(whoami)"
alias gme="git branch $@ | sed -E 's/^\*? *//' | xargs -L 1 git log -1 --pretty='%Cgreen%ci %Cblue(%cr) %Cred%h%Cgreen%d %Creset%s' | sort -n"
alias gmer="git branch -a | grep -v HEAD | sed -E 's/^\*? *//' | xargs -L 1 git log -1 --pretty='%h %an' | egrep \"^[0-9a-z]+ $(git config --get user.name)\" | cut -d ' ' -f 1 | xargs -L 1 git log -1 --pretty='%Cgreen%ci %Cblue(%cr) %Cred%h%Cgreen%d %Creset%s' | sort -n | uniq"
alias grd='git_review_diffs() { base_commit=`git merge-base HEAD $1`;git log --reverse --pretty=%h $base_commit..HEAD | xargs -I{} -L1 git diff {}~1..{} -- $2 ; } ; git_review_diffs'
alias rtags='ctags -R --languages=Ruby --totals -f tags'

alias tS="tmux new -s"
alias trd="tmux attach-session -t"
alias tpair="tmux -S /tmp/pair new -s pair"

export INPUTRC=$HOME/.inputrc
export PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH:$HOME/bin

set -o vi

source ~/.git_completion.bash
source ~/.tmux.completion.bash

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

eval "$(rbenv init -)"

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
