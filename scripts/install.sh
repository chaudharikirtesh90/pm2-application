#!/bin/bash
set -euo pipefail

APP_DIR="/home/ubuntu/node-app"

echo "Checking Node.js..."
node -v

echo "Checking npm..."
npm -v

echo "Creating application directory..."
mkdir -p "$APP_DIR"

cd "$APP_DIR"

if [ -f package.json ]; then
    echo "Installing application dependencies..."
    npm install --production
else
    echo "WARNING: package.json not found"
fi

if ! command -v pm2 >/dev/null 2>&1; then
    echo "Installing PM2..."
    sudo npm install -g pm2
fi

echo "PM2 version:"
pm2 -v

echo "Installation completed successfully."
