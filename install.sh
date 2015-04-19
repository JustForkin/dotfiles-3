if [ "$1" == "osx" ]; then
  CP_R="cp -R"
else
  CP_R="cp -r"
fi

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
$CP_R config/ ~/.config

# Vim
rm -rf ~/.vim*

cp vim/vimrc ~/.vimrc
mkdir ~/.vim
$CP_R vim/dot_vim/* ~/.vim
$CP_R vim/bundle/* ~/.vim/bundle/

curl -o ~/.git_completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
