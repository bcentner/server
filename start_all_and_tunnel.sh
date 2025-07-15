#!/bin/bash

if ! command -v loclx > /dev/null 2>&1; then
  echo "Error: loclx (LocalXpose) is not installed or not in PATH. Exiting..."
  exit 1
fi

# Start all services
./start_all.sh

# Start LocalXpose tunnel for www.benportfolio.xyz to port 8000
# Requires loclx to be installed and authenticated
nohup loclx tunnel http --reserved-domain www.benportfolio.xyz --to 8000 > logs/loclx_tunnel.log 2>&1 &
echo $! > logs/loclx_tunnel.pid

echo "LocalXpose tunnel started! Logs: logs/loclx_tunnel.log" 
