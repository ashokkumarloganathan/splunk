#!/bin/bash

set -e

echo "🔻 Stopping Docker services..."
sudo systemctl stop docker || true
sudo systemctl stop containerd || true

echo "🧹 Removing Docker packages..."
for pkg in docker docker-engine docker.io docker-ce docker-ce-cli containerd containerd.io docker-compose docker-compose-plugin docker-buildx-plugin; do
  sudo apt-get purge -y "$pkg" || true
done

echo "🗑️ Removing Docker dependencies and cleanup..."
sudo apt-get autoremove -y --purge
sudo apt-get autoclean

echo "🧼 Deleting Docker files and volumes..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf /etc/systemd/system/docker.service
sudo rm -rf /etc/systemd/system/docker.socket
sudo rm -rf /etc/systemd/system/containerd.service
sudo rm -rf /lib/systemd/system/docker*
sudo rm -rf /lib/systemd/system/containerd*

echo "🧾 Removing Docker APT sources..."
sudo rm -f /etc/apt/sources.list.d/docker.list
sudo rm -f /etc/apt/keyrings/docker.asc
sudo rm -f /etc/apt/keyrings/docker.gpg

echo "👥 Removing Docker group (if exists)..."
sudo groupdel docker || true

echo "✅ Docker has been completely removed."
