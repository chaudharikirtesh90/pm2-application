#!/bin/bash
set -euo pipefail

APP_DIR="/home/ubuntu/node-app"

echo "================================"
echo "Installing application"
echo "================================"

# Update packages
sudo apt-get update -y

# Install required tools
sudo apt-get install -y curl

# Install Node.js 20 if not already installed
if ! command -v node >/dev/null 2>&1; then

    echo "Node.js not found. Installing Node.js..."

    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

    sudo apt-get install -y nodejs

else

    echo "Node.js already installed:"
    node -v

fi

# Verify Node.js
echo "Node version:"
node -v

echo "NPM version:"
npm -v


# Install PM2 if not already installed
if ! command -v pm2 >/dev/null 2>&1; then

    echo "PM2 not found. Installing PM2..."

    sudo npm install -g pm2

else

    echo "PM2 already installed:"
    pm2 -v

fi


# Create application directory
sudo mkdir -p "$APP_DIR"

sudo chown -R ubuntu:ubuntu "$APP_DIR"

cd "$APP_DIR"


# Install application dependencies
if [ -f package.json ]; then

    echo "Installing application dependencies..."

    npm install --production

else

    echo "WARNING: package.json not found"

fi


echo "================================"
echo "Installation completed"
echo "================================"
