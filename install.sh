#!/bin/bash

# Determine Vendor
YUM_BIN=$(which yum)
APT_GET_BIN=$(which apt-get)

# Custom Installer
custom_install() {
  echo "Installing $1"
  if [[ ! -z $YUM_BIN ]]; then
     if sudo yum install $1 -y > /dev/null; then
       echo "OK"
     else
       echo "KO"
     fi
  elif [[ ! -z $APT_GET_BIN ]]; then 
    if sudo apt-get -qq install $1 -y > /dev/null; then
       echo "OK"
    else
       echo "KO"
    fi
  else
     echo "error can't install package $1"
     exit 0;
  fi              
}

# Installing VIM
custom_install "vim"

# Installing ZSH
custom_install "zsh"

# Installing I3
custom_install "i3"

# Installing Rofi
custom_install "rofi"

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install diff-so-fancy
sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -P /bin && sudo chmod 777 /bin/diff-so-fancy  

# Creating symlink to custom omzsh themes
echo "Creating omzsh themes symlink"
if ! ln -s $HOME/.dotfiles/zsh/themes/* $HOME/.oh-my-zsh/themes > /dev/null; then
  echo "OK"
else 
  echo "KO"
fi

# Create the bin folder
mkdir -p ~/bin

# Files included
DOT_DIR="$HOME/.dotfiles"
FILES=" alias gitconfig gitignore bashrc commonrc i3 vim vimrc zshrc"

# Link dotfiles
for f in $FILES; do
    FILE="$HOME/.$f"
    ln -sf $DOT_DIR/$f $FILE;
done

