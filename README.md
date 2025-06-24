# Server

A server to host various projects.

## Table of Contents
- [Poetry Usage](#poetry-usage)
- [Project Structure](#project-structure)
- [Nginx Configuration](#nginx-configuration)

## Poetry Usage

### Updating Virtual Environment
```bash
poetry install
```

### Running Applications
```bash
poetry shell
gunicorn -w 1 -b localhost:800X wsgi:app
```

## Project Structure

- **Nginx directory**: Contains a copy of the nginx configuration file

## Nginx Configuration

After making changes to the nginx config, update the symlink and restart nginx:

```bash
# Link the config file (if not already linked)
sudo ln -s /etc/nginx/sites-available/portfolio /etc/nginx/sites-enabled/

# Restart nginx to apply changes
sudo service nginx restart
```