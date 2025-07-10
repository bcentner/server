#!/bin/bash

# Start all services
./start_all.sh

# Start LocalXpose tunnel for www.benportfolio.xyz to port 8000
# Requires loclx to be installed and authenticated
nohup loclx tunnel http --reserved-domain www.benportfolio.xyz --to 8000 > logs/loclx_tunnel.log 2>&1 &
echo $! > logs/loclx_tunnel.pid

echo "LocalXpose tunnel started! Logs: logs/loclx_tunnel.log" 