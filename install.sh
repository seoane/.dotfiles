#!/usr/bin/env sh
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install zsh
apt install zsh -y

# Create the bin folder
mkdir -p ~/bin
# Files included
DOT_DIR="$HOME/.dotfiles"
FILES=" alias bashrc commonrc i3 tmux.conf vim vimrc zshrc"

# Link dotfiles
for f in $FILES; do
    FILE="$HOME/.$f"
    ln -sf $DOT_DIR/$f $FILE;
done
