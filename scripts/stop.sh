#!/bin/bash
set -euo pipefail

APP_DIR="/home/ubuntu/node-app"
cd "$APP_DIR"

if command -v pm2 >/dev/null 2>&1; then
  pm2 delete node-pm2-frontend >/dev/null 2>&1 || true
fi
