#!/bin/bash

echo "Stopping all services..."

# Stop nginx
sudo nginx -s stop 2>/dev/null || echo "Nginx was not running"

# Function to kill process if PID file exists
kill_if_pid_exists() {
    local service_name=$1
    local pid_file="logs/${service_name}.pid"
    
    if [ -f "$pid_file" ]; then
        local pid=$(cat "$pid_file")
        if kill -0 "$pid" 2>/dev/null; then
            echo "Stopping $service_name (PID: $pid)..."
            kill "$pid"
            rm "$pid_file"
        else
            echo "$service_name was not running"
            rm "$pid_file"
        fi
    else
        echo "$service_name PID file not found"
    fi
}

# Kill all gunicorn processes
kill_if_pid_exists "cta_tracker"
kill_if_pid_exists "portfolio"
kill_if_pid_exists "stream_finder"
kill_if_pid_exists "letterboxd_recommender"

# Also kill any remaining gunicorn processes on our ports
echo "Killing any remaining processes on ports 8001-8004..."
for port in 8001 8002 8003 8004; do
    pid=$(lsof -ti:$port 2>/dev/null)
    if [ ! -z "$pid" ]; then
        echo "Killing process on port $port (PID: $pid)"
        for p in $pid; do
            kill "$p"
        done
    fi
done

echo "All services stopped!" 