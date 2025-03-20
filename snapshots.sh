#!/usr/bin/bash

cleanup() {
  echo "Script aborted"
  exit 1
}

trap cleanup INT 

tools=("timeshift grub-btrfs inotify-tools")
for tool in "${tools[@]}"; do
  echo "Let's install $tool"
  sudo pacman -S "$tool"
  if [ $? -eq 0 ];then
    echo "$tool installed!"
  else
    echo "Installation of $tool failed "
    read -p "Would you retry the installation (y/n)" confirm
    if [ "$confim" == "y" ]; then
      sudo pacman -S --noconfirm "$tool"
    fi
  fi
done
yaytools=("timeshift-autosnap")
for yaytool in "${yaytools[@]}"; do
  yay -S yaytool
  if [$? -eq 0]; then
    echo "yaytool installed"
  else
    echo "installation of $yaytool failed"
    read -p "Would you retry the installation (y/n)" confirm
    if [ "$confim" == "y" ]; then
      yay -S --noconfirm "$tool"
    fi
  fi
done
