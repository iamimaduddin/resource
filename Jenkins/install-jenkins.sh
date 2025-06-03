#!/bin/bash

# ----------------------------------------------
# Jenkins Installation Script for Ubuntu/Debian
# Tested on Ubuntu 20.04 / 22.04
# Author: Mohammed Imaduddin
# ----------------------------------------------


## 📋 Features
# - Installs Java (OpenJDK 17 Headless)
# - Adds official Jenkins GPG key
# - Adds Jenkins APT repository
# - Installs Jenkins
# - Starts and enables Jenkins service
# - Displays the initial admin password

## 🖥️ Compatible With
# - Ubuntu 20.04, 22.04
# - Debian 10/11+

# Update system package index
echo "🔄 Updating system packages..."
sudo apt-get update -y

# Install OpenJDK 17 (headless version)
echo "☕ Installing OpenJDK 17 (JRE Headless)..."
sudo apt install openjdk-17-jre-headless -y

# Verify Java installation
echo "✅ Verifying Java installation..."
java -version

# Download the Jenkins GPG key to verify package authenticity
echo "🔑 Adding Jenkins GPG key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to system sources
echo "📦 Adding Jenkins APT repository..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package index again to include Jenkins repo
echo "🔄 Updating package list with Jenkins repo..."
sudo apt-get update -y

# Install Jenkins
echo "🚀 Installing Jenkins..."
sudo apt-get install jenkins -y

# Enable Jenkins to start on boot
echo "🔧 Enabling Jenkins service..."
sudo systemctl enable jenkins

# Start Jenkins service
echo "▶️ Starting Jenkins service..."
sudo systemctl start jenkins

# Check Jenkins status
echo "📈 Checking Jenkins service status..."
sudo systemctl status jenkins

# Show initial admin password
echo "🔐 Jenkins Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# To Run Script Make the Script Executable
# chmod +x install-jenkins.sh
#
# Run the  script with sudo
# sudo ./install-jenkins.sh
#
#  Uninstallation of Jenkins
#  sudo apt remove jenkins -y
#  sudo apt autoremove -y
