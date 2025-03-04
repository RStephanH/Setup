#!/bin/bash
cd ~/playground/
git clone https://github.com/RStephanH/Setup.git --depth=1

if [ echo $? -eq 0 ] ; then
    cd Setup
    mv ~/.config/nvim/init.lua init.lua.bak
    mv init.lua ~/.config/nvim/
    if command npm -v &> /dev/null; then
        npm install -g pyright
        npm install -g html-language-bin
    fi
    if command pacman -v &> /dev/null; then
        sudo pacman -S clangd
    fi
else
    echo "Failed to clone  the repository"
    exit 1
fi
