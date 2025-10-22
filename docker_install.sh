#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Stage 1${NC}"
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

echo -e "${GREEN}Stage 2${NC}"
# Step 1: Remove old Docker versions (safe to ignore errors)
echo -e "${GREEN}Removing old Docker versions (if any)...${NC}"

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
    sudo apt-get remove -y "$pkg" || true
done

echo -e "${GREEN}Stage 3${NC}"
# Step 2: Update package index
echo -e "${GREEN}Updating package index...${NC}"
sudo apt-get update -y

# Step 3: Install prerequisites
echo -e "${GREEN}Installing prerequisites...${NC}"
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Step 4: Add Docker's official GPG key
echo -e "${GREEN}Adding Docker’s GPG key...${NC}"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Step 5: Set up the Docker repository
echo -e "${GREEN}Adding Docker repository...${NC}"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
  https://download.docker.com/linux/debian \
  bookworm stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

echo -e "${GREEN}Stage 4${NC}"
# Step 6: Install Docker Engine and related packages
echo -e "${GREEN}Installing Docker Engine and plugins...${NC}"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 7: Create docker group if it doesn't exist
if ! getent group docker > /dev/null; then
    echo -e "${GREEN}Creating 'docker' group...${NC}"
    sudo groupadd docker
else
    echo -e "${YELLOW}'docker' group already exists.${NC}"
fi

# Step 8: Add current user to Docker group
echo -e "${GREEN}Adding user '$USER' to docker group...${NC}"
sudo usermod -aG docker "$USER"

# Step 9: Verify Installation
echo -e "${GREEN}Verifying Docker and Compose installation...${NC}"
docker --version || echo -e "${YELLOW}⚠️ You may need to re-login before using Docker without sudo.${NC}"
docker compose version || true

# Final Notes
echo -e "${GREEN}✅ Docker and Docker Compose installation complete!${NC}"
echo -e "${YELLOW}🔁 Please log out and back in or reboot for group changes to take effect.${NC}"
