#!/usr/bin/env bash
set -e

# Ctrl+C handler
trap 'echo "Aborted."; exit 1' INT

install_gns3() {
  echo "🔧 Adding GNS3 PPA and installing GUI/server..."
  sudo add-apt-repository -y ppa:gns3/ppa
  sudo apt update
  sudo apt install -y gns3-gui gns3-server

  echo "🐧 Enabling non-root usage prompts..."
  # On Ubuntu you'll be prompted during installation of ubridge/wireshark
}

install_iou() {
  echo "🛠️ Adding i386 architecture and installing IOU..."
  sudo dpkg --add-architecture i386
  sudo apt update
  sudo apt install -y gns3-iou
}

install_docker() {
  echo "🐳 Installing Docker CE..."
  sudo apt remove -y docker docker-engine docker.io containerd runc || true
  sudo apt update
  sudo apt install -y ca-certificates curl gnupg lsb-release

  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
     https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

final_steps() {
  echo "🔐 Adding user to necessary groups..."
  sudo usermod -aG ubridge,libvirt,kvm,wireshark,docker "${USER}"
  echo "✅ Installation complete!"
  echo "Please log out and log back in (or reboot) to apply group changes."
}

# ---------- Main ----------

install_gns3

read -rp "Include IOU support? [y/N]: " resp
[[ $resp =~ ^[Yy]$ ]] && install_iou

read -rp "Install Docker CE for container support? [y/N]: " resp
[[ $resp =~ ^[Yy]$ ]] && install_docker

final_steps
