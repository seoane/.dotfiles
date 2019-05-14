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

# Installing cmake
custom_install "cmake"

# Installing cairo-lib
custom_install "libcairo2-dev"

# Installing python-xcbgen
custom_install "python-xcbgen"

# Installing libcurl
custom_install "libcurl4-openssl-dev"

# Installing libmpdclient
custom_install "libmpdclient-dev"

# Installing Libiw
custom_install "libiw-dev"

# Installing xcb-xkb
custom_install "libxcb-xkb-dev"

# Installing xcb-randr
custom_install "libxcb-randr0-dev"

# Installing xcb-proto
custom_install "xcb-proto"

# Installing libxcb-util-dev
custom_install "libxcb-util-dev"

# Installing libxcb-icccm4-dev
custom_install "libxcb-icccm4-dev"

# Installing libxcb-image0-dev
custom_install "libxcb-image0-dev"

# Installing VIM
custom_install "vim"

# Installing NVIM
custom_install "neovim"

# Installing ZSH
custom_install "zsh"

# Installing Curl
custom_install "curl"

# Installing I3
custom_install "i3"

# Installing Rofi
custom_install "rofi"

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install polybar
git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar /tmp/polybar
mkdir /tmp/polybar/build
cd /tmp/polybar/build
cmake ..
sudo make install

# Install vim-plug
sh -c "$(curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"

# Install diff-so-fancy
sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -P /bin && sudo chmod 777 /bin/diff-so-fancy

# Creating symlink to custom omzsh themes
echo "Creating omzsh themes symlink"
if ! ln -s $HOME/.dotfiles/zsh/themes/* $HOME/.oh-my-zsh/themes > /dev/null; then
  echo "OK"
else
  echo "KO"
fi

# Creating symlink to custom omzsh themes
echo "Creating nvim init.vim symlink"
if ! ln -s $HOME/.dotfiles/config/nvim/init.vim $HOME/.config/nvim/init.vim > /dev/null; then
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

