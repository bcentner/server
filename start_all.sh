#!/bin/bash

# Start CTA Tracker (Poetry)
cd cta_tracker
poetry run gunicorn -w 1 -b localhost:8002 wsgi:application &

# Start Portfolio (venv)
cd ../portfolio
source venv/bin/activate
gunicorn -w 1 -b localhost:8001 wsgi:application &
deactivate

# Start Stream Finder (venv)
cd ../stream-finder
source venv/bin/activate
gunicorn -w 1 -b localhost:8003 wsgi:application &
deactivate

# Start Nginx
sudo nginx

echo "All services started!"