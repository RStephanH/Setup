#!/bin/bash
tools=("timeshift" "grub-btrfs" "inotify-tools")

for package in ${tools[@]}; do
  echo "Let's install $package"
  sudo pacman -S "$package"
done
