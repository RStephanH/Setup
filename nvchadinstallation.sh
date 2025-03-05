#!/bin/bash
##nvchad
sudo pacman -S nvim 
echo "Don't forget to launch the command :\\
 ':MasonInstallAll'\\
 ':TSInstall All'\\
 ':Lazy sync'"
sleep 4
cd /mnt/hdd_512/archive/fonts/
unzip JetBrainsMono.zip 
sudo cp -a JetBrainsMono/ /usr/share/fonts/
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

