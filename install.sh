# Create bin dir
mkdir -p $HOME/bin

# Misc
cp bashrc ~/.bashrc
cp gemrc ~/.gemrc
cp gitconfig ~/.gitconfig
cp gitignore_global ~/.gitignore_global
cp inputrc ~/.inputrc
cp tmux.conf ~/.tmux.conf
cp tmux.completion.bash ~/.tmux.completion.bash

# xorg
cp xorg/xinitrc ~/.xinitrc
cp xorg/Xresources ~/.Xresources
cp xorg/Xmodmap ~/.Xmodmap
cp -r config ~/.config

# Vim
rm -rf ~/.vim*

cp vim/vimrc ~/.vimrc
cp vim/gvimrc ~/.gvimrc
mkdir ~/.vim
cp -r vim/dot_vim/* ~/.vim

curl -o ~/.git_completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
