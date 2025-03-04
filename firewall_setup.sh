#!/bin/bash

set -e  # Exit immediately if a command fails

echo "Installing UFW (Uncomplicated Firewall)..."
sudo pacman -S ufw

echo "Configuring firewall rules..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp   # Allow HTTP (optional)
sudo ufw allow 443/tcp  # Allow HTTPS (optional)

echo "Enabling logging..."
sudo ufw logging on

echo "Enabling UFW..."
sudo ufw --force enable

echo "Firewall is now active and secured!"
sudo ufw status verbose
