# Blog Demo

[![Tests](https://github.com/alexinslc/blog_demo/actions/workflows/test.yml/badge.svg)](https://github.com/alexinslc/blog_demo/actions/workflows/test.yml)
[![Lint and Security](https://github.com/alexinslc/blog_demo/actions/workflows/lint.yml/badge.svg)](https://github.com/alexinslc/blog_demo/actions/workflows/lint.yml)
[![Docker Build](https://github.com/alexinslc/blog_demo/actions/workflows/docker.yml/badge.svg)](https://github.com/alexinslc/blog_demo/actions/workflows/docker.yml)

A modern Ruby on Rails blog application demonstrating user authentication and CRUD operations for blog posts. Built with Rails 8.1, Hotwire (Turbo & Stimulus), Importmap, and Devise authentication.

## Features

- User authentication (sign up, sign in, password reset) via Devise
- Create, read, update, and delete blog posts
- User profiles showing authored posts
- Modern frontend with Hotwire/Turbo for SPA-like interactions
- Importmap for JavaScript dependencies (no Node.js required)
- Propshaft for efficient asset management
- Responsive design
- Docker support for development and production
- Comprehensive CI/CD with GitHub Actions

## Tech Stack

- **Ruby**: 3.3.6
- **Rails**: 8.1.0
- **Database**: SQLite3 (with enhanced production features in Rails 8)
- **Authentication**: Devise
- **Frontend**: Turbo, Stimulus, Importmap
- **Asset Pipeline**: Propshaft
- **Server**: Puma
- **CI/CD**: GitHub Actions (tests, linting, security, Docker builds)
- **Containerization**: Docker & Docker Compose

## Prerequisites

- Ruby 3.3.6 (install via rbenv or rvm)
- Bundler gem
- SQLite3
- Docker & Docker Compose (optional, for containerized development)

## Quick Start with Docker

The fastest way to get started:

```bash
# Clone the repository
git clone https://github.com/alexinslc/blog_demo.git
cd blog_demo

# Start with Docker Compose
docker-compose up

# In another terminal, setup the database
docker-compose exec web bin/rails db:create db:migrate db:seed
```

Visit `http://localhost:3000` in your browser.

## Local Development Setup

### Installation

```bash
# Install Ruby dependencies
bundle install

# Setup database
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

### Running the Application

```bash
# Start the Rails server
bin/rails server

# Or use the Procfile for development
bin/dev
```

Visit `http://localhost:3000` in your browser.

## Running Tests

```bash
# Run all tests
bin/rails test

# Run system tests (requires Chrome)
bin/rails test:system

# Run linting
rubocop

# Run security scan
brakeman

# Run dependency audit
bundle audit check
```

## Deployment

### Docker Deployment

Build and run the production image:

```bash
docker build -t blog_demo .
docker run -p 3000:3000 -e RAILS_ENV=production blog_demo
```

### Pull from GitHub Container Registry

```bash
docker pull ghcr.io/alexinslc/blog_demo:latest
docker run -p 3000:3000 ghcr.io/alexinslc/blog_demo:latest
```

## Development with VS Code DevContainer

Open the project in VS Code with the Dev Containers extension installed:

1. Command Palette: "Dev Containers: Reopen in Container"
2. Wait for container to build
3. Run `bin/rails db:prepare` in the integrated terminal
4. Start server with `bin/rails server`

## Project Structure

- `app/` - Rails application code (models, views, controllers)
- `config/` - Application configuration
- `db/` - Database schema and migrations
- `test/` - Test suite (unit and system tests)
- `.github/workflows/` - CI/CD workflows
- `.devcontainer/` - VS Code DevContainer configuration
- `Dockerfile` - Production Docker image
- `docker-compose.yml` - Development environment

## CI/CD

This project uses GitHub Actions for:

- **Tests**: Runs on every push/PR, ensures all tests pass
- **Linting & Security**: RuboCop, Brakeman, bundler-audit
- **Docker**: Builds and publishes images to GitHub Container Registry

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please ensure:
- All tests pass (`bin/rails test`)
- Code follows style guidelines (`rubocop`)
- No security vulnerabilities (`brakeman`)

## License

MIT License - see LICENSE file for details
