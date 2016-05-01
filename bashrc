BLACK="\[\e[0;30m\]" # reverse video
CYAN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
MAGENTA="\[\e[0;35m\]"
GREEN="\[\e[0;36m\]"
GRAY="\[\e[0;37m\]"

UNAME=$(uname)

stty erase ^?

export EDITOR="vim"
export PS1="$YELLOW\u$GRAY@$CYAN\h $YELLOW\w$MAGENTA \$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[0m\n# "
export TERM="screen-256color"
export GEM_HOME=./gems
export GEM_PATH=./gems
export TEST_BENCH_EXCLUDE_PATTERN="_init.rb$"

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
alias gemlocal="gem build *.gemspec && gem install *.gem && rm -vf *.gem"
alias ruby-frozen-string-literal="ruby --enable-frozen-string-literal"

alias tS="tmux new -s"
alias trd="tmux attach-session -t"
alias tpair="test -S /tmp/pair && tmux -S /tmp/pair attach-session || tmux -S /tmp/pair new -s pair"

export INPUTRC=$HOME/.inputrc
export PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH:$HOME/bin

set -o vi

source ~/.ssh_completion.bash
source ~/.git_completion.bash
source ~/.tmux.completion.bash

which dircolors >/dev/null && eval $(dircolors ~/.dir_colors)
which keychain >/dev/null && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
which rbenv >/dev/null && eval "$(rbenv init -)"

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

test -f ~/.bashrc.local && source ~/.bashrc.local
