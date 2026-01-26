# CLAUDE.md - Blog Demo

## What is this?
A modern Ruby on Rails blog application demonstrating user authentication (Devise) and CRUD operations for blog posts. Built with Rails 8.1, Hotwire, and Importmap.

## Tech Stack
- **Framework**: Rails 8.1.0
- **Ruby**: 3.3.6
- **Database**: SQLite3
- **Auth**: Devise
- **Frontend**: Turbo, Stimulus, Importmap (no Node.js)
- **Asset Pipeline**: Propshaft
- **Server**: Puma

## Project Structure
```
blog_demo/
├── app/
│   ├── controllers/
│   ├── models/
│   ├── views/
│   └── javascript/
├── config/
├── db/
├── test/
└── bin/
```

## Commands
```bash
bundle install        # Install gems
bin/rails server      # Dev server (port 3000)
bin/rails test        # Run test suite
bin/rails db:migrate  # Apply migrations

# Docker development
docker-compose up     # Start all services
```

## Features
- User authentication (sign up, sign in, password reset)
- Create, read, update, delete blog posts
- User profiles showing authored posts
- SPA-like interactions via Hotwire/Turbo
- Responsive design

## Code Conventions
- Follow Rails Way
- RuboCop for style enforcement
- Hotwire for interactivity
- Importmap for JS dependencies
- Devise for all auth needs

## CI/CD
GitHub Actions for:
- Tests
- Linting
- Security scanning
- Docker builds

See `CONTRIBUTING.md` for contribution guidelines.
