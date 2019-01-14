# General
UNAME=$(uname)

export EDITOR="vim"
export INPUTRC=$HOME/.inputrc
if [ $UNAME != "Linux" ]; then
  export PATH=/usr/local/bin:$PATH
fi

set -o vi

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
alias gri="git rebase -p --keep-empty -i"
alias less="less -R"
alias copy-settings="for example in settings/*.example; do cp -v \$example settings/\$(basename \$example .example); done"
alias tmux-maximize="tmux resize -Z"

source ~/.git-functions.bash

if [ $UNAME = "Linux" ]; then
  alias ls="ls --color"
else
  alias ls="ls -G"
fi

alias tS="tmux new -s"
alias trd="tmux attach-session -t"
alias tpair="test -S /tmp/pair && tmux -S /tmp/pair attach-session || tmux -S /tmp/pair new -s pair"

alias trelease="kill $(ps -d --format pid,cmd,start_time --sort start_time | grep $(tmux display-message -p '#S' | sed -E 's/^(.)/[\1]/') | head -n 1 | cut -d ' ' -f 1)"

alias rb="ruby --disable-gems"

# Ruby configuration
export GEM_PATH=./gems
export TEST_BENCH_EXCLUDE_PATTERN="_init.rb$"

if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
fi
if [ -f /usr/share/chruby/chruby.sh ]; then
  source /usr/share/chruby/chruby.sh
fi

# Tab completion
source ~/.ssh_completion.bash
source ~/.git_completion.bash
source ~/.tmux.completion.bash

# Dircolors (for solarized theme)
which dircolors >/dev/null && eval $(dircolors ~/.dir_colors)

# SSH Keychain
which keychain >/dev/null && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

test -f ~/.bashrc.local && source ~/.bashrc.local
