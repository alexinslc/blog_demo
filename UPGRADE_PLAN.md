# Rails 8.1.0 Upgrade Plan

## Overview
This document outlines the upgrade path from Rails 7.2.2 (Ruby 3.1.1) to Rails 8.1.0 with containerization, CI/CD, and modern tooling.

## Current State
- **Rails Version**: 7.2.2.2
- **Ruby Version**: 3.1.1
- **Database**: SQLite3
- **Asset Pipeline**: jsbundling-rails + cssbundling-rails (esbuild + sass)
- **Authentication**: Devise
- **Tests**: Minitest (9 test files)
- **Container**: Outdated devcontainer (Ruby 3.1)
- **CI/CD**: None (only Dependabot configured)

## Target State
- **Rails Version**: 8.1.0
- **Ruby Version**: 3.3.6 (latest stable for Rails 8.1)
- **Database**: SQLite3 (with modern configuration)
- **Asset Pipeline**: Propshaft + Importmap (Rails 8 defaults)
- **Authentication**: Devise (updated for Rails 8)
- **Tests**: Minitest with modern setup
- **Container**: Production-ready Dockerfile + dev container
- **CI/CD**: GitHub Actions (tests, linting, security)

## Upgrade Sequence

Issues must be completed in the following order:

### Phase 1: Foundation (Issues #1-3)
1. **Issue #1**: Upgrade Ruby to 3.3.6
2. **Issue #2**: Update test fixtures and ensure tests pass
3. **Issue #3**: Update Devise and dependencies for Rails 7.2 compatibility

### Phase 2: Rails 8.1 Upgrade (Issues #4-6)
4. **Issue #4**: Upgrade to Rails 8.1.0
5. **Issue #5**: Migrate from jsbundling/cssbundling to Propshaft + Importmap
6. **Issue #6**: Update application code for Rails 8.1 compatibility

### Phase 3: Containerization (Issues #7-8)
7. **Issue #7**: Create production Dockerfile and docker-compose
8. **Issue #8**: Update devcontainer for Rails 8.1 and Ruby 3.3.6

### Phase 4: CI/CD & Quality (Issues #9-11)
9. **Issue #9**: Add GitHub Actions workflow for tests
10. **Issue #10**: Add GitHub Actions workflow for linting and security
11. **Issue #11**: Add GitHub Actions workflow for Docker build

### Phase 5: Documentation (Issue #12)
12. **Issue #12**: Update README and documentation for Rails 8.1

## Key Changes in Rails 8.1
- **Propshaft**: Replaces Sprockets as default asset pipeline
- **Importmap**: Default for JavaScript management
- **SQLite3**: Enhanced with production-ready features
- **Solid Queue**: Built-in background job processing
- **Solid Cache**: Built-in caching backend
- **Kamal**: Built-in deployment tool

## Testing Strategy
After each phase, verify:
- ✓ All tests pass (`rails test`)
- ✓ Application starts (`rails server`)
- ✓ Database migrations work (`rails db:migrate`)
- ✓ Development environment functions correctly

## Rollback Plan
Each issue should be completed in its own feature branch. If issues arise:
1. Branch off main for each issue
2. Test thoroughly before merging
3. Use PRs for review
4. Tag successful phase completions

## References
- [Rails 8.1 Release Notes](https://guides.rubyonrails.org/8_1_release_notes.html)
- [Upgrading Ruby on Rails](https://guides.rubyonrails.org/upgrading_ruby_on_rails.html)
- [Rails 8.1 Documentation](https://edgeguides.rubyonrails.org/)
