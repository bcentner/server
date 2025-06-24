# Server

A server to host various projects.

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


After a config change link:
sudo ln -s /etc/nginx/sites-available/portfolio /etc/nginx/sites-enabled/

Restart nginx -> sudo service nginx restart