complete \
  -W "$(sed -E -n 's/^Host[ \t]+(.*)[ \t]*$/\1/p' ~/.ssh/config | uniq | xargs echo)" \
  ssh
