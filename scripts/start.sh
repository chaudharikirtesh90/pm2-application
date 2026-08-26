#!/bin/bash
set -euo pipefail

APP_DIR="/home/ubuntu/node-app/node-app"
mkdir -p "$APP_DIR"
cd "$APP_DIR"

if ! command -v pm2 >/dev/null 2>&1; then
  npm install -g pm2
fi

export NODE_ENV=production
pm2 start app.js --name node-pm2-frontend --watch --max-memory-restart 300M --time
pm2 save
