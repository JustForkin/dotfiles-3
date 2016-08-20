# General
UNAME=$(uname)

export EDITOR="vim"
export INPUTRC=$HOME/.inputrc
if [ $UNAME != "Linux" ]; then
  export PATH=/usr/local/bin:$PATH
fi
export TERM="screen-256color"

set -o vi

stty erase ^?

# Prompt
BLACK="\[\e[0;30m\]" # reverse video
CYAN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
MAGENTA="\[\e[0;35m\]"
GREEN="\[\e[0;36m\]"
GRAY="\[\e[0;37m\]"
RESET="\[\e[0m\]"

export PS1="$YELLOW\u$GRAY@$CYAN\h $YELLOW\w$MAGENTA \$(git symbolic-ref --short HEAD 2>/dev/null)$RESET\n# "

# Aliases
alias glf="git log --pretty=full"
alias gls='git log --graph --decorate --oneline'
alias gc='git commit -v'
alias gd="git diff"
alias gap='git add -N . && git add -p'
alias gdc="git diff --cached"
alias gs="git status"
alias less="less -R"
if [ $UNAME = "Linux" ]; then
  alias ls="ls --color"
else
  alias ls="ls -G"
fi
alias tS="tmux new -s"
alias trd="tmux attach-session -t"
alias tpair="test -S /tmp/pair && tmux -S /tmp/pair attach-session || tmux -S /tmp/pair new -s pair"

# Ruby configuration
export GEM_PATH=./gems
export TEST_BENCH_EXCLUDE_PATTERN="_init.rb$"
source /usr/local/share/chruby/chruby.sh

# Tab completion
source ~/.ssh_completion.bash
source ~/.git_completion.bash
source ~/.tmux.completion.bash

# Dircolors (for solarized theme)
which dircolors >/dev/null && eval $(dircolors ~/.dir_colors)

# SSH Keychain
which keychain >/dev/null && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

test -f ~/.bashrc.local && source ~/.bashrc.local
