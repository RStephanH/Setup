#!/usr/bin/bash
cleanup() {
  echo "Script aborted!"
  exit 1
}
trap cleanup INT 
  tools=("zsh" "vim" "github-cli" "ghostty" "remmina" "obs-studio" "yakuake" "wireshark-qt" "obsidian" "telegram-desktop" "thunderbird" "cmake" "kernel-devel")
  for tool in "${tools[@]}"; do
      sudo pacman -S $tool
      if [ $? -eq 0 ]; then
          echo "$tool installed"
      else
          echo "$tool not installed"
      fi
  done

