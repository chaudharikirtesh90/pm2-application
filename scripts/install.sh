#!/bin/bash
set -euo pipefail

APP_DIR="/home/ubuntu/node-app"

echo "Loading Node.js environment..."

export HOME="/home/ubuntu"
export NVM_DIR="/home/ubuntu/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
else
    echo "ERROR: NVM is not installed at $NVM_DIR"
    exit 1
fi

nvm use --lts

echo "Node version:"
node -v

echo "NPM version:"
npm -v

echo "Creating application directory..."

mkdir -p "$APP_DIR"

cd "$APP_DIR"

if [ -f package.json ]; then
    echo "Installing npm dependencies..."
    npm install --production
fi

if ! command -v pm2 >/dev/null 2>&1; then
    echo "Installing PM2..."
    npm install -g pm2
fi

echo "Installation completed successfully."
