#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Checking for existing Docker installation...${NC}"

# Function to check if Docker is installed
if command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker is already installed: $(docker --version)${NC}"
    echo -e "${YELLOW}Skipping Docker installation.${NC}"

    if docker compose version &> /dev/null; then
        echo -e "${YELLOW}Docker Compose is also installed: $(docker compose version)${NC}"
    else
        echo -e "${YELLOW}Docker Compose plugin not found. Installing now...${NC}"
        sudo apt-get update -y
        sudo apt-get install -y docker-compose-plugin
    fi

    exit 0
fi

echo -e "${GREEN}Docker not found. Proceeding with installation...${NC}"

# Step 1: Remove old Docker versions (safe to ignore errors)
echo -e "${GREEN}Removing old Docker versions (if any)...${NC}"
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Step 2: Update package index
echo -e "${GREEN}Updating package index...${NC}"
sudo apt-get update -y

# Step 3: Install prerequisites
echo -e "${GREEN}Installing prerequisites...${NC}"
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Step 4: Add Docker’s GPG key
echo -e "${GREEN}Adding Docker GPG key...${NC}"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Step 5: Set up the Docker repository (for Debian/Kali)
echo -e "${GREEN}Setting up Docker APT repository...${NC}"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 6: Install Docker Engine and Compose plugin
echo -e "${GREEN}Installing Docker Engine and Compose plugin...${NC}"
sudo apt-get update -y
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# Step 7: Enable and start Docker
echo -e "${GREEN}Enabling and starting Docker service...${NC}"
sudo systemctl enable docker
sudo systemctl start docker

# Step 8: Add current user to Docker group
echo -e "${GREEN}Adding user '$USER' to docker group...${NC}"
sudo usermod -aG docker "$USER"

# Step 9: Verify Installation
echo -e "${GREEN}Verifying Docker and Compose installation...${NC}"
docker --version
docker compose version

echo -e "${GREEN}✅ Docker and Docker Compose installation complete!${NC}"
echo -e "${YELLOW}🔁 Please log out and back in for group changes to take effect.${NC}"
