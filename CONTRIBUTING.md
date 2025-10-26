# Contributing to Blog Demo

Thank you for considering contributing to Blog Demo! We welcome contributions from everyone and appreciate your effort to make this project better.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Workflow](#development-workflow)
- [Pull Request Process](#pull-request-process)
- [Style Guidelines](#style-guidelines)
- [Testing](#testing)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)

## Code of Conduct

This project adheres to a code of conduct that all contributors are expected to follow. Please be respectful and constructive in all interactions.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:
- Ruby 3.3.6 (via rbenv or rvm)
- Bundler gem
- SQLite3
- Git

Or use Docker:
- Docker
- Docker Compose

### Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/blog_demo.git
   cd blog_demo
   ```
3. Add the upstream repository:
   ```bash
   git remote add upstream https://github.com/alexinslc/blog_demo.git
   ```

### Set Up Development Environment

#### Option 1: Local Setup

```bash
# Install dependencies
bundle install

# Set up the database
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed

# Start the server
bin/rails server
```

#### Option 2: Docker Setup

```bash
# Start services
docker-compose up

# In another terminal, set up the database
docker-compose exec web bin/rails db:create db:migrate db:seed
```

Visit `http://localhost:3000` to verify everything works.

## How to Contribute

### Types of Contributions

We welcome many types of contributions:
- 🐛 Bug fixes
- ✨ New features
- 📝 Documentation improvements
- 🎨 UI/UX enhancements
- ✅ Test coverage improvements
- 🔧 Configuration and tooling improvements
- 🌐 Translations

### Before You Start

1. **Check existing issues**: Search for existing issues or PRs related to your contribution
2. **Create an issue**: For major changes, create an issue first to discuss your approach
3. **Small changes**: For typos or small bug fixes, feel free to submit a PR directly

## Development Workflow

### 1. Create a Branch

Create a descriptive branch name:

```bash
git checkout -b feature/add-comment-system
git checkout -b fix/user-authentication-bug
git checkout -b docs/update-installation-guide
```

### 2. Make Your Changes

- Write clear, concise code
- Follow the existing code style
- Add tests for new functionality
- Update documentation as needed

### 3. Commit Your Changes

Write clear commit messages following this format:

```bash
git commit -m "Add comment system for blog posts

- Create Comment model with associations
- Add comment form to post show page
- Implement comment moderation
- Add tests for comment functionality"
```

**Good commit messages:**
- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Reference issues and PRs when applicable
- Keep the first line under 72 characters

### 4. Stay Up to Date

Regularly sync with the upstream repository:

```bash
git fetch upstream
git rebase upstream/main
```

## Pull Request Process

### Before Submitting

Ensure your contribution meets these requirements:

1. **Tests pass**: All tests must pass
   ```bash
   bin/rails test
   bin/rails test:system
   ```

2. **Linting passes**: Code follows style guidelines
   ```bash
   rubocop
   ```

3. **Security checks pass**: No security vulnerabilities
   ```bash
   brakeman
   bundle audit check
   ```

4. **Documentation updated**: Update relevant documentation if needed

### Submitting Your PR

1. Push your branch to your fork:
   ```bash
   git push origin feature/add-comment-system
   ```

2. Go to the [repository on GitHub](https://github.com/alexinslc/blog_demo)

3. Click "New Pull Request"

4. Select your fork and branch

5. Fill out the PR template with:
   - **Title**: Clear, concise description of the change
   - **Description**: Detailed explanation of what and why
   - **Related Issues**: Link to any related issues (e.g., "Fixes #123")
   - **Screenshots**: For UI changes, include before/after screenshots
   - **Testing**: Describe how you tested your changes

### PR Review Process

1. **Automated checks**: CI/CD will run tests, linting, and security scans
2. **Code review**: Maintainers will review your code
3. **Feedback**: Address any requested changes
4. **Approval**: Once approved, a maintainer will merge your PR

### After Your PR is Merged

1. Delete your branch (GitHub will prompt you)
2. Update your local repository:
   ```bash
   git checkout main
   git pull upstream main
   git push origin main
   ```

## Style Guidelines

### Ruby Style

- Follow the [Ruby Style Guide](https://rubystyle.guide/)
- Use RuboCop for automatic style checking
- Configuration is in `.rubocop.yml`

**Key points:**
- Use 2 spaces for indentation (no tabs)
- Keep lines under 120 characters
- Use snake_case for methods and variables
- Use CamelCase for classes and modules

### JavaScript Style

- Follow modern ES6+ conventions
- Use meaningful variable names
- Keep functions small and focused

### Git Commit Messages

- First line: 72 characters or less
- Blank line after first line
- Detailed explanation if necessary
- Reference issues with `#issue_number`

## Testing

### Running Tests

```bash
# Run all tests
bin/rails test

# Run specific test file
bin/rails test test/models/post_test.rb

# Run system tests
bin/rails test:system

# Run with coverage
COVERAGE=true bin/rails test
```

### Writing Tests

- Write tests for all new features
- Write tests for bug fixes to prevent regression
- Use meaningful test names
- Follow the existing test structure

**Example:**

```ruby
test "should create post with valid attributes" do
  post = Post.new(title: "Test", body: "Content", user: users(:one))
  assert post.save
end
```

## Reporting Bugs

### Before Reporting

1. Check if the bug has already been reported
2. Try to reproduce the bug on the latest version
3. Collect relevant information

### Creating a Bug Report

Create an issue with:

- **Title**: Short, descriptive title
- **Description**: Clear description of the problem
- **Steps to reproduce**: Numbered steps to reproduce the issue
- **Expected behavior**: What you expected to happen
- **Actual behavior**: What actually happened
- **Environment**: OS, Ruby version, Rails version
- **Screenshots**: If applicable
- **Error messages**: Full error messages or stack traces

## Suggesting Enhancements

We love new ideas! To suggest an enhancement:

1. **Check existing issues**: See if it's already been suggested
2. **Create an issue** with:
   - Clear title and description
   - Use case: Why is this enhancement valuable?
   - Proposed solution: How might it work?
   - Alternatives: Other approaches you considered
   - Mockups/examples: If applicable

## Questions?

- **Issues**: Open an issue for bugs or feature requests
- **Discussions**: Use GitHub Discussions for questions and ideas
- **Documentation**: Check the [README](README.md) for basic information

## Recognition

Contributors will be recognized in:
- The GitHub contributors page
- Release notes for significant contributions
- Our gratitude! 🎉

Thank you for contributing to Blog Demo!
