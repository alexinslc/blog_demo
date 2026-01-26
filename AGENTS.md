# AGENTS.md - Blog Demo

## Project Summary
Modern Rails blog app with user authentication and CRUD operations. Built with Rails 8.1, Hotwire, Devise.

## Tech Stack
| Component | Technology |
|-----------|------------|
| Framework | Rails 8.1.0 |
| Ruby | 3.3.6 |
| Database | SQLite3 |
| Auth | Devise |
| Frontend | Turbo, Stimulus, Importmap |
| Assets | Propshaft |
| Server | Puma |

## Directory Structure
```
blog_demo/
├── app/           # MVC components
├── config/        # Rails config
├── db/            # Migrations, seeds
├── test/          # Test suite
└── bin/           # Executables
```

## Commands
| Command | Purpose |
|---------|---------|
| `bundle install` | Install dependencies |
| `bin/rails server` | Start dev server |
| `bin/rails test` | Run tests |
| `bin/rails db:migrate` | Run migrations |
| `docker-compose up` | Docker development |

## Features
- User auth (sign up, sign in, password reset)
- Blog post CRUD
- User profiles
- SPA-like UX via Hotwire

## Code Conventions
1. Follow Rails Way
2. RuboCop for style
3. Hotwire for interactivity
4. Importmap for JS (no Node.js)
5. Devise for authentication

## CI/CD
GitHub Actions: tests, linting, security, Docker
