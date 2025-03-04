#!/bin/bash
cd ~/playground/
git clone https://github.com/RStephanH/Setup.git --depth=1

if [ echo $? -eq 0 ] ; then
    cd Setup
    mv ~/.config/nvim/init.lua init.lua.bak
    mv init.lua ~/.config/nvim/
else
    echo "Failed to clone  the repository"
    exit 1
fi
