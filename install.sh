# Misc
cp bashrc ~/.bashrc
cp gemrc ~/.gemrc
cp gitconfig ~/.gitconfig
cp inputrc ~/.inputrc
cp tmux.conf ~/.tmux.conf
cp tmux.completion.bash ~/.tmux.completion.bash

# Vim
rm -rf ~/.vim*

cp vim/vimrc ~/.vimrc
cp vim/gvimrc ~/.gvimrc
mkdir ~/.vim
cp -r vim/dot_vim/* ~/.vim

curl -o ~/.git_completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
