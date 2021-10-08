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

# Installing awscli
custom_install "awscli"

# Installing cmake
custom_install "cmake"

# Installing cairo-lib
custom_install "libcairo2-dev"

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

# Installing Polybar 
custom_install "polybar"

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install omzsh highlight plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install vim-plug
sh -c "$(curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"

# Install diff-so-fancy
sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -P /bin && sudo chmod 777 /bin/diff-so-fancy

# Download powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.dotfiles/zsh/themes/

# Create the bin folder
mkdir -p ~/bin

#echo "Creating omzsh themes symlink"
if ! ln -s $HOME/.dotfiles/zsh/themes/powerlevel10k $HOME/.oh-my-zsh/themes/powerlevel10k > /dev/null; then
  echo "OK"
else
  echo "KO"
fi

# Files included
DOT_DIR="$HOME/.dotfiles"
FILES=" alias config/polybar gitconfig gitignore bashrc i3 commonrc vim vimrc zshrc p10k.zsh"

# Link dotfiles
for f in $FILES; do
    FILE="$HOME/.$f"
    ln -sf $DOT_DIR/$f $FILE;
done

# Install Pk10 fonts
if [ ! -d $HOME/.local/share/fonts/ ]; then
  mkdir -p $HOME/.local/share/fonts/;
fi
cp $HOME/.dotfiles/zsh/fonts/* $HOME/.local/share/fonts/
fc-cache -f -v

