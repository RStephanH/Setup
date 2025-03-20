#!/usr/bin/bash
cleanup() {
  echo "Script aborted!"
  exit 1
}
trap cleanup INT 
  tools=("ghostty" "remmina" "obs-studio" "libvirtd" "qemu" "yakuake" "wireshark" "obsidian" "telegram-desktop" "thinderbird" "virtualbox" "cmake" "kernel-devel")
  for tool in "${tools[@]}"; do
      sudo pacman -S $tool
      if [ $? -eq 0 ]; then
          echo "$tool installed"
      else
          echo "$tool not installed"
      fi
  done

