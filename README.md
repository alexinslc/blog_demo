# Blog Demo

A simple Ruby on Rails blog application demonstrating user authentication and CRUD operations for blog posts. Built with Rails 7.2, Hotwire (Turbo & Stimulus), and Devise authentication.

## Features

- User authentication (sign up, sign in, password reset) via Devise
- Create, read, update, and delete blog posts
- User profiles showing authored posts
- Modern frontend with Hotwire/Turbo for SPA-like interactions
- Responsive design with bundled CSS/JavaScript

## Tech Stack

- **Ruby**: 3.1.1
- **Rails**: 7.2.2
- **Database**: SQLite3
- **Authentication**: Devise
- **Frontend**: Turbo, Stimulus, CSS/JS bundling
- **Server**: Puma

## Setup

### Prerequisites

- Ruby 3.1.1 (install via rbenv or rvm)
- Bundler gem
- Node.js and Yarn (for asset bundling)

### Installation

```bash
# Install Ruby dependencies
bundle install

# Install JavaScript dependencies
yarn install

# Setup database
rails db:create
rails db:migrate
rails db:seed

# Build assets
rails assets:precompile
```

## Running the Application

```bash
# Start the Rails server
rails server

# Or use the Procfile for development with assets
bin/dev
```

Visit `http://localhost:3000` in your browser.

## Running Tests

```bash
rails test
rails test:system
```

## License

MIT License - see LICENSE file for details
