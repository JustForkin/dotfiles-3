CYAN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
MAGENTA="\[\e[1;35m\]"
GREEN="\[\e[1;36m\]"
GRAY="\[\e[0;37m\]"

export PS1="$GRAY[$YELLOW\u$GRAY@$CYAN\h $YELLOW\w$MAGENTA\$(git branch 2>&1 | sed -nE -e 's/^\*(.*)\$/\1/p')$GRAY]# "

alias be="bundle exec"
alias ls="ls -G"
alias screen="TERM=screen screen"
alias rtest="bundle exec ruby -Itest"
alias brake="bundle exec rake"
alias gitsha='git rev-parse HEAD | pbcopy'

source ~/.rvm/scripts/rvm

export PATH=$PATH:/usr/local/mysql/bin
