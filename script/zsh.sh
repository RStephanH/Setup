#!/bin/bash

#sudo apt update
#install zsh
#sudo apt install zsh
#installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install external plugins
sudo apt install zsh-autosuggestions zsh-syntax-highlighting zsh
#load syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
