# 🚀 Server

A comprehensive server setup to host various projects and applications.

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Poetry Usage](#poetry-usage)
- [Nginx Configuration](#nginx-configuration)
- [Local Development](#local-development)
- [Projects](#projects)

## 🎯 Overview

This server hosts multiple projects including a CTA tracker, portfolio website, and stream finder application. It's configured with Nginx for production deployment and includes Docker support for containerized applications.

## 📁 Project Structure

```
server/
├── cta_tracker/          # CTA transit tracking application
├── nginx/               # Nginx configuration files
├── portfolio/           # Personal portfolio website
└── stream-finder/       # Streaming service finder
```

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- Poetry (for dependency management)
- Nginx (for production)
- Docker (optional, for containerized deployment)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd server
   ```

2. **Install dependencies**
   ```bash
   poetry install
   ```

## 📦 Poetry Usage

### Managing Dependencies

```bash
# Install all dependencies
poetry install

# Add a new dependency
poetry add package-name

# Remove a dependency
poetry remove package-name

# Update dependencies
poetry update
```

### Running Applications

```bash
# Activate the virtual environment
poetry shell

# Run a specific application (replace X with port number)
gunicorn -w 1 -b localhost:800X wsgi:app
```

**Common Ports:**
- `8001` - Portfolio
- `8002` - CTA Tracker
- `8003` - Stream Finder

## 🌐 Nginx Configuration

The server uses Nginx for reverse proxy and load balancing in production.

### Configuration Management

```bash
# Link the config file (if not already linked)
sudo ln -s /etc/nginx/sites-available/portfolio /etc/nginx/sites-enabled/

# Test configuration
sudo nginx -t

# Reload nginx to apply changes
sudo nginx -s reload

# Restart nginx completely
sudo systemctl restart nginx
```

### Configuration Files

- **Location**: `/etc/nginx/sites-available/`
- **Backup**: `nginx/` directory contains configuration backups

## 🔧 Local Development

### LocalXpose for External Access

Use LocalXpose to expose your local development server to the internet for testing or sharing.

1. **Install LocalXpose**
   ```bash
   # Download and install from https://localxpose.io/
   ```

2. **Login to your account**
   ```bash
   loclx account login
   ```

3. **Create a tunnel**
   ```bash
   loclx tunnel http --to localhost:8001
   ```

**Dashboard**: https://localxpose.io/dashboard/

## 📱 Projects

### 🚇 CTA Tracker
Real-time Chicago Transit Authority tracking application with live updates and route information.

### 🎨 Portfolio
Personal portfolio website showcasing projects and professional experience.

### 🎬 Stream Finder
Application to help users find where movies and TV shows are available for streaming.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

