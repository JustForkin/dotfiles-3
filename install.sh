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

cd ~/.vim/ruby/command-t &&
  ruby extconf.rb &&
  make
