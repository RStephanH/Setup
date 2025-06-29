#!/bin/bash

#func
cleanup() {
  echo "The script has been aborted"
  exit 1
}

trap cleanup INT 

  echo "This script is going to install zsh and personnalise it"
  if  ! command -v bat &>/dev/null ; then
    pacman -S bat
  fi

  sleep 1
  read -p "Would you like to run the script (y/n)" confirm
  
  if [ "$confirm"=='y' ]; then

    echo -e "Let's get started!\n"

    echo -e "Installing zsh...\n"
    sudo pacman -S "zsh"

    echo "Retreiving oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Cloning powerlevel10k, syntax-highlighting, autosuggestions"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    sleep 1
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    sleep 1
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    echo "Editing .zshrc"
    touch ~/zshrc.mod
    sed 's/ZSH_THEME/#&/' ~/.zshrc > ~/zshrc.mod
    sed -i '/ZSH_THEME/a\ZSH_THEME="powerlevel10k/powerlevel10k"' ~/zshrc.mod
    sed -i 's/plugins=(git/& sudo zsh-autosuggestions zsh-syntax-highlighting/' ~/zshrc.mod

    echo "Verification..."
    bat ~/zshrc.mod
    read -p "Is it correct ?(y/n)" confirm
    if [ $confirm=='y' ]; then
      cd ~/
      mv .zshrc .zshrc.bak
      mv zshrc.mod .zshrc
    fi
    echo "All done. Now run 'source ~/.zshrc'"

  else
    cleanup
  fi
