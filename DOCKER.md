# Docker Deployment Guide

This guide covers deploying the Blog Demo application using Docker.

## Prerequisites

- Docker Engine 20.10+
- Docker Compose 2.0+

## Quick Start

### 1. Generate Secret Key

```bash
docker run --rm -it ruby:3.3.6-slim ruby -rsecurerandom -e 'puts SecureRandom.hex(64)'
```

### 2. Configure Environment

```bash
cp .env.example .env
# Edit .env and set SECRET_KEY_BASE to the generated value
```

### 3. Build and Run

```bash
# Build the image
docker-compose build

# Start the application
docker-compose up -d

# Check logs
docker-compose logs -f web

# Check health
curl http://localhost:3000/up
```

The application will be available at http://localhost:3000

### 4. Database Setup

The database is automatically created and migrated on first run via the docker-entrypoint script.

## Docker Commands

### Build

```bash
# Build the production image
docker build -t blog_demo:latest .

# Build with specific tag
docker build -t blog_demo:v1.0.0 .
```

### Run

```bash
# Run with docker-compose (recommended)
docker-compose up -d

# Run single container
docker run -d \
  -p 3000:3000 \
  -e SECRET_KEY_BASE=your_secret_here \
  -v blog_demo_db:/rails/db \
  -v blog_demo_storage:/rails/storage \
  --name blog_demo \
  blog_demo:latest
```

### Manage

```bash
# View logs
docker-compose logs -f

# Stop application
docker-compose down

# Stop and remove volumes (⚠️ deletes database)
docker-compose down -v

# Restart application
docker-compose restart

# Execute commands in container
docker-compose exec web bundle exec rails console
docker-compose exec web bundle exec rails db:migrate
```

## Production Deployment

### Environment Variables

Required:
- `SECRET_KEY_BASE` - Rails secret key (generate with command above)

Optional:
- `RAILS_ENV` - Environment (default: production)
- `RAILS_MAX_THREADS` - Puma threads (default: 5)
- `WEB_CONCURRENCY` - Puma workers (default: 2)
- `RAILS_LOG_TO_STDOUT` - Log to stdout (default: true)
- `RAILS_SERVE_STATIC_FILES` - Serve static files (default: true)

### Database

The application uses SQLite3 by default with persistent volumes:
- `db_data` - Database files
- `storage_data` - ActiveStorage uploads
- `log_data` - Application logs

### Volumes

Volumes are created automatically by docker-compose. To backup:

```bash
# Backup database
docker run --rm \
  -v blog_demo_db_data:/source \
  -v $(pwd):/backup \
  alpine tar czf /backup/db_backup.tar.gz -C /source .

# Restore database
docker run --rm \
  -v blog_demo_db_data:/target \
  -v $(pwd):/backup \
  alpine tar xzf /backup/db_backup.tar.gz -C /target
```

### Security

The Docker image follows security best practices:

1. **Multi-stage build** - Smaller final image (~200MB)
2. **Non-root user** - Application runs as `rails` user (UID 1000)
3. **Minimal base image** - ruby:3.3.6-slim
4. **No development dependencies** - Only production gems
5. **Health checks** - Built-in health monitoring

### Scaling

To scale horizontally, use PostgreSQL instead of SQLite:

1. Update `docker-compose.yml` to add PostgreSQL service
2. Update `Gemfile` to use `pg` gem instead of `sqlite3`
3. Set `DATABASE_URL` environment variable

Example:

```yaml
services:
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
  
  web:
    environment:
      - DATABASE_URL=postgresql://postgres:${POSTGRES_PASSWORD}@db:5432/blog_demo_production
```

## Docker Image Details

### Image Layers

1. **Base** - Ruby 3.3.6 slim with runtime dependencies
2. **Build** - Installs build tools and gems
3. **Final** - Production-ready image with application

### Image Size

Target: < 500MB
- Base Ruby image: ~150MB
- Gems: ~50MB
- Application code: ~10MB
- Total: ~210MB

### Health Check

The image includes a health check that pings `/up` every 30 seconds:
- Start period: 40s (gives app time to boot)
- Timeout: 3s
- Retries: 3
- Interval: 30s

## Troubleshooting

### Container won't start

```bash
# Check logs
docker-compose logs web

# Check if port is in use
lsof -i :3000

# Verify SECRET_KEY_BASE is set
docker-compose exec web env | grep SECRET
```

### Database errors

```bash
# Reset database (⚠️ deletes data)
docker-compose down -v
docker-compose up -d

# Run migrations manually
docker-compose exec web rails db:migrate
```

### Permission errors

```bash
# Fix volume permissions
docker-compose exec web chown -R rails:rails /rails/db /rails/storage /rails/log
```

## CI/CD Integration

See `.github/workflows/docker.yml` for automated Docker builds.

## Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Rails Docker Guide](https://guides.rubyonrails.org/getting_started_with_devcontainer.html)
- [Multi-stage Builds](https://docs.docker.com/build/building/multi-stage/)
