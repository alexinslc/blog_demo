# GitHub Copilot Instructions for Blog Demo

## Project Overview
A modern Ruby on Rails blog application demonstrating user authentication and CRUD operations. Built with Rails 8.1, Hotwire, and Devise.

## Tech Stack
- **Framework**: Rails 8.1.0, Ruby 3.3.6
- **Database**: SQLite3
- **Auth**: Devise
- **Frontend**: Turbo, Stimulus, Importmap, Propshaft
- **Server**: Puma

## Project Structure
```
blog_demo/
├── app/           # MVC components
├── config/        # Rails configuration
├── db/            # Migrations, seeds
├── test/          # Test files
└── bin/           # Executables
```

## Commands
```bash
bundle install     # Install dependencies
bin/rails server   # Start dev server
bin/rails test     # Run tests
bin/rails db:migrate  # Run migrations

# Docker
docker-compose up  # Start via Docker
```

## Code Conventions
- Follow Rails conventions
- RuboCop for code style
- Hotwire for SPA-like interactions
- No Node.js required (Importmap)
- Devise for authentication
