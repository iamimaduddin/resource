#!/bin/bash

# Docker Installation Script for Ubuntu (20.04/22.04)
## 📋 Prerequisites

# - OS: Ubuntu 20.04 or 22.04
# - Sudo access

## 📦 What This Script Does
# 1. Updates apt package index 
# 2. Installs dependencies (`curl`, `ca-certificates`, `gnupg`)
# 3. Adds Docker's official GPG key
# 4. Adds the Docker apt repository
# 5. Installs Docker Engine, CLI, containerd, and Docker Compose

set -e

echo "🔄 Updating package index..."
sudo apt-get update

echo "📦 Installing dependencies..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "📁 Creating keyring directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "🔑 Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "📝 Setting permissions for GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "➕ Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index with Docker repo..."
sudo apt-get update

echo "📥 Installing Docker Engine and Docker Compose..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Docker installation complete!"
echo "🔧 Add current user to 'docker' group to run without sudo (optional):"
echo "   sudo usermod -aG docker $USER"
