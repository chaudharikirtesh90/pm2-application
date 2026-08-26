#!/bin/bash
set -euo pipefail

APP_DIR="/home/ubuntu/node-app"

# Load Node.js / NVM
export NVM_DIR="/home/ubuntu/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

echo "Node version:"
node -v

echo "NPM version:"
npm -v

mkdir -p "$APP_DIR"
cd "$APP_DIR"

if [ -f package.json ]; then
    npm install --production
fi

if ! command -v pm2 >/dev/null 2>&1; then
    npm install -g pm2
fi

echo "Installation completed successfully."
