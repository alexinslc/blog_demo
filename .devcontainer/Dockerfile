# Ruby 3.3.6 for Rails 8.1 development
FROM ruby:3.3.6-bookworm

# Install development dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    libsqlite3-dev \
    libvips \
    nodejs \
    npm \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Rails 8.1
RUN gem install rails -v '~> 8.1.0'

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev,.app.github.dev"

# Set working directory
WORKDIR /workspace

# Switch to non-root user
USER $USERNAME
