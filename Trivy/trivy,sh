!/bin/bash

# 1. Install dependencies
sudo apt-get install -y wget apt-transport-https gnupg

# 2. Import Aqua Security’s GPG key
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

# 3. Add the Trivy repository
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | \
sudo tee -a /etc/apt/sources.list.d/trivy.list

# 4. Update package list
sudo apt-get update

# 5. Install Trivy
sudo apt-get install -y trivy

