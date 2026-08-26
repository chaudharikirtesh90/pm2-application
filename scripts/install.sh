#!/bin/bash
set -euo pipefail

APP_DIR="/home/ubuntu/node-app"
mkdir -p "$APP_DIR"
cd "$APP_DIR"

if [ -f package.json ]; then
  npm install --production
fi

if ! command -v pm2 >/dev/null 2>&1; then
  npm install -g pm2
fi
