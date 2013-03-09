CYAN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
MAGENTA="\[\e[1;35m\]"
GREEN="\[\e[1;36m\]"
GRAY="\[\e[0;37m\]"

export EDITOR="vim"
export PS1="$GRAY$YELLOW\u$GRAY@$CYAN\h $YELLOW\w$MAGENTA\$(git branch 2>&1 | sed -nE -e 's/^\*(.*)\$/\1/p')$GRAY\n# "
export TERM="xterm-256color"

alias be="bundle exec"
alias less="less -R"
alias ls="ls -G"
alias rtest="bundle exec ruby -Itest -Ispec"
alias brake="bundle exec rake"

alias gitsha="git rev-parse HEAD | pbcopy"
alias glf="git log --pretty=full"
alias gls='git log --graph --pretty="%Cgreen%h%Creset%Cblue%d%Creset %Cred%an%Creset: %s"'
alias gd="git diff"
alias ga='git add'
alias gap='git add -p'
alias gdc="git diff --cached"
alias gs="git status"
alias gsd="git diff --stat --summary"
alias g,="git add ."
alias g.="git commit -a"

alias tS="tmux new -s"
alias trd="tmux attach-session -t"

export INPUTRC=$HOME/.inputrc
export PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH

set -o vi

source ~/.git_completion.bash

eval "$(rbenv init -)"
