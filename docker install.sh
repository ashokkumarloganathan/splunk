#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Docker & Docker Compose installation...${NC}"

# Step 1: Remove older versions
echo -e "${GREEN}Removing old Docker versions if they exist...${NC}"
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Step 2: Update package index
echo -e "${GREEN}Updating package index...${NC}"
sudo apt-get update -y

# Step 3: Install prerequisites
echo -e "${GREEN}Installing required packages...${NC}"
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Step 4: Add Docker’s official GPG key
echo -e "${GREEN}Adding Docker GPG key...${NC}"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Step 5: Set up the Docker repository
echo -e "${GREEN}Setting up Docker repository...${NC}"
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 6: Install Docker Engine
echo -e "${GREEN}Installing Docker Engine...${NC}"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 7: Test Docker installation
echo -e "${GREEN}Testing Docker installation...${NC}"
sudo docker --version

# Step 8: Enable and start Docker
echo -e "${GREEN}Enabling and starting Docker service...${NC}"
sudo systemctl enable docker
sudo systemctl start docker

# Step 9: Add current user to docker group (optional)
echo -e "${GREEN}Adding user '$USER' to docker group (you may need to log out and back in)...${NC}"
sudo usermod -aG docker $USER

# Step 10: Test Docker Compose
echo -e "${GREEN}Testing Docker Compose plugin...${NC}"
docker compose version

echo -e "${GREEN}Docker and Docker Compose installation completed! ✅${NC}"
