#!/bin/bash

cleanup(){
  echo "Script aborted!"
  exit 1
}
trap cleanup INT {
  packages=( "nvidia-dkms" "nvidia-utils" "lib32-nvidia-utils" "nvidia-settings" "vulkan-icd-loader" "lib32-vulkan-icd-loader
")
  for package in "${packages[@]}"
  sudo pacman -S --needed }
