#!/usr/bin/env bash

# Handle Ctrl+C (SIGINT)
cleanup() {
  echo "Script aborted!"
  exit 1
}
trap cleanup INT

# Default list of tools
tools=(
  "zsh"
  "vim"
  "github-cli"
  "ghostty"
  "remmina"
  "obs-studio"
  "yakuake"
  "wireshark-qt"
  "obsidian"
  "telegram-desktop"
  "thunderbird"
  "cmake"
  "base-devel" 
  "btop" 
  "bat" 
  "fx" 
  "virt-manager"
  "virt-viewer"
  "virtualbox" 
  "hyprland"
)

echo "📦 Default tools to be installed:"
for tool in "${tools[@]}"; do
  echo " - $tool"
done

echo
read -rp "Enter tools you do NOT want to install (space-separated), or press Enter to install all: " exclude_input

# Convert input string to array
read -ra exclude <<< "$exclude_input"

# Remove excluded tools from list
filtered_tools=()
for tool in "${tools[@]}"; do
  skip=false
  for ex in "${exclude[@]}"; do
    if [[ "$tool" == "$ex" ]]; then
      skip=true
      break
    fi
  done
  $skip || filtered_tools+=("$tool")
done

echo
echo "✅ Tools that will be installed:"
for tool in "${filtered_tools[@]}"; do
  echo " - $tool"
done
echo

# Confirm before installing
read -rp "Proceed with installation? [y/N]: " confirm
[[ "$confirm" =~ ^[Yy]$ ]] || exit 0

# Install missing tools
for tool in "${filtered_tools[@]}"; do
  if pacman -Q "$tool" &>/dev/null; then
    echo "$tool is already installed. Skipping."
  else
    echo "Installing $tool..."
    if sudo pacman -S --noconfirm "$tool"; then
      echo "$tool installed successfully."
    else
      echo "❌ Failed to install $tool."
    fi
  fi
done

