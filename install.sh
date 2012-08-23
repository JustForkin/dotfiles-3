# Misc
cp screenrc ~/.screenrc
cp bashrc ~/.bashrc
cp gemrc ~/.gemrc

# Vim
rm -rf ~/.vim*

cp vim/vimrc ~/.vimrc
cp vim/gvimrc ~/.gvimrc
mkdir ~/.vim
cp -r vim/dot_vim/* ~/.vim

curl -o ~/.git_completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash

cd ~/.vim/ruby/command-t &&
  ruby extconf.rb &&
  make
