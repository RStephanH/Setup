#!/usr/bin/env bash

# Handle Ctrl+C (SIGINT)
cleanup() {
  echo "Script aborted!"
  exit 1
}
trap cleanup INT

# Compatible tools for Linux Mint via APT
tools=(
  "zsh"
  "vim" 
  "git"
  "gh"  # GitHub CLI
  "remmina" 
  "tmux" 
  "nmap" 
  "obs-studio"
  "wireshark"
  "telegram-desktop"
  "thunderbird"
  "cmake"
  "btop"
  "bat"
  "virt-manager"
  "virt-viewer"
  "virtualbox"
  "linux-headers-$(uname -r)"
  "build-essential"
  "libvirt-daemon-system"
  "tigervnc-viewer"
  "kitty"
  "gcc"
  "clang"
  "qemu-system"
  "qemu-utils"
  "qemu-kvm"
  "bridge-utils"
  "dnsmasq-base"
)

echo "📦 Default tools to be installed:"
for tool in "${tools[@]}"; do
  echo " - $tool"
done

echo
read -rp "Enter tools you do NOT want to install (space-separated), or press Enter to install all: " exclude_input

# Convert input string to array
read -ra exclude <<< "$exclude_input"

# Filter out excluded tools
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

# Update APT cache
echo "🔄 Updating package list..."
sudo apt update

# Install missing tools
for tool in "${filtered_tools[@]}"; do
  if dpkg -s "$tool" &>/dev/null; then
    echo "$tool is already installed. Skipping."
  else
    echo "Installing $tool..."
    if sudo apt install -y "$tool"; then
      echo "$tool installed successfully."
    else
      echo "❌ Failed to install $tool."
    fi
  fi
done
