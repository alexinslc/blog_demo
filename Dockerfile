# syntax=docker/dockerfile:1
# This Dockerfile is optimized for production deployment of Rails 8.1 applications

# Stage 1: Base image with Ruby 3.3.6
FROM ruby:3.3.6-slim AS base

# Install base dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libsqlite3-0 \
    && rm -rf /var/lib/apt/lists/*

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test"

# Stage 2: Build stage for installing dependencies
FROM base AS build

# Install build dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libsqlite3-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /rails

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Stage 3: Final production image
FROM base

# Set working directory
WORKDIR /rails

# Create rails user for running the application (security best practice)
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash

# Copy built artifacts from build stage
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build --chown=rails:rails /rails /rails

# Create directories for SQLite database and logs with proper permissions
RUN mkdir -p /rails/storage /rails/db /rails/log /rails/tmp && \
    chown -R rails:rails /rails/storage /rails/db /rails/log /rails/tmp

# Switch to rails user
USER rails:rails

# Entrypoint prepares the database
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expose port 3000
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:3000/up || exit 1

# Start the server by default
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
