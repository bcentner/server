#!/bin/bash

# Create logs directory if it doesn't exist
mkdir -p logs

# Start CTA Tracker (Poetry)
cd cta_tracker
poetry run gunicorn -w 1 -b localhost:8002 wsgi:application \
--access-logfile ../logs/cta_tracker_access.log \
--error-logfile ../logs/cta_tracker_error.log &
echo $! > ../logs/cta_tracker.pid

# Start Portfolio (venv)
cd ../portfolio
if [ ! -d "venv" ]; then
  echo "Error: venv directory not found in portfolio. Exiting."
  exit 1
fi
source venv/bin/activate
gunicorn -w 1 -b localhost:8001 wsgi:application \
--access-logfile ../logs/portfolio_access.log \
--error-logfile ../logs/portfolio_error.log &
echo $! > ../logs/portfolio.pid
deactivate

# Start Stream Finder (venv)
cd ../stream-finder
if [ ! -d "venv" ]; then
  echo "Error: venv directory not found in stream-finder. Exiting."
  exit 1
fi
source venv/bin/activate
gunicorn -w 1 -b localhost:8003 wsgi:application \
--access-logfile ../logs/stream_finder_access.log \
--error-logfile ../logs/stream_finder_error.log &
echo $! > ../logs/stream_finder.pid
deactivate

# Start Letterboxd Recommender (venv)
cd ../letterboxd-recommender
if [ ! -d "venv" ]; then
  echo "Error: venv directory not found in letterboxd-recommender. Exiting."
  exit 1
fi
source venv/bin/activate
gunicorn -w 1 -b localhost:8004  wsgi:application \
--access-logfile ../logs/letterboxd_recommender_access.log \
--error-logfile ../logs/letterboxd_recommender_error.log &
echo $! > ../logs/letterboxd_recommender.pid
deactivate

if ! command -v nginx > /dev/null 2>&1; then
  echo "Error: nginx is not installed or not in PATH. Exiting..."
  exit 1
fi

# Start Nginx
sudo nginx

echo "All services started!"
echo "Logs are available in the logs/ directory"
echo "Use stop_all.sh to stop all services"
