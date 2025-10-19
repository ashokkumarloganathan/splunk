#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Starting Docker uninstallation...${NC}"

# Step 1: Stop Docker service
echo -e "${GREEN}Stopping Docker service...${NC}"
sudo systemctl stop docker || true

# Step 2: Remove Docker packages
echo -e "${GREEN}Removing Docker packages...${NC}"
sudo apt-get purge -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin \
  docker-compose \
  docker.io \
  docker-engine \
  docker

# Step 3: Remove Docker directories and volumes
echo -e "${GREEN}Removing Docker files and volumes...${NC}"
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf /var/run/docker.sock

# Step 4: Remove Docker GPG key and APT source
echo -e "${GREEN}Cleaning up Docker APT source and GPG key...${NC}"
sudo rm -f /etc/apt/keyrings/docker.gpg
sudo rm -f /etc/apt/sources.list.d/docker.list
sudo apt-get update -y

# Step 5: Optionally remove the user from the docker group
if grep -q docker /etc/group; then
  echo -e "${GREEN}Removing user '$USER' from docker group...${NC}"
  sudo gpasswd -d "$USER" docker || true
fi

echo -e "${GREEN}✅ Docker has been completely uninstalled.${NC}"
