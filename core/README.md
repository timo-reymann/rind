core
===

Core logic of rind.

# Development

## Requirements

- npm (for installing bats)
- go 1.17+
- working docker installation

## Testing

```bash
# Run tests locally and on docker
make test

# Run tests in docker container
make test-docker

# Run tests on host only
make test-host
```
