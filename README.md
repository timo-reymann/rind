rind - Run in docker
===
[![pre-commit](https://img.shields.io/badge/%E2%9A%93%20%20pre--commit-enabled-success)](https://pre-commit.com/)

Run tasks in dockerized environments, avoiding Docker in Docker (dind) and crazy workarounds.

## Requirements

### Runtime

- bash (4+)
- docker

## Usage

- Install on your target system and use the `rind command`:
  ```bash
  bash <(curl -sS https://raw.githubusercontent.com/timo-reymann/poc-rind/main/installer)
  ```
- Download and directly pipe to bash
  ```bash
  curl -sS https://raw.githubusercontent.com/timo-reymann/poc-rind/main/core/rind | bash -s - --log-level DEBUG
  ```

- Use the [terraform module](./terraform)

## Why?

Sometimes you have linux dependencies or tool chains you don't want to install locally but already have in your
pipelines.

For example:

- python lambda that also uses [deterministic-zip](https://github.com/timo-reymann/deterministic-zip) and includes
  dependencies that install native parts for linux
- you want to run a script that only works on *nix and don't want to adopt that it works on MacOS

You could run this locally on MacOS or even on a *nix-system and than would have problems with different target
architectures.

So you could use always a docker container to run this tasks, but when you use CI you probably already use Docker for
the job itself.

Using docker in docker is painful and not supported for all providers, so why not getting the best out of both worlds? -
This is where rind comes in.

## Implementation

- Pure bash (posix compliant) + docker cli
- Decide based on `/.dockerenv` OR `cgroup` if we are running inside a container or not
- In container
    - Delete artifacts
    - Run setup
    - Run main
- On hosts
    - Copy current directory to build context
    - Delete artifacts to avoid readonly limitations
    - Run setup
    - Run main
    - Create image as volume container
    - Copy files to host

## Notes on implementation

### Why not just mounting the entire directory?

Copying files and small file changes are slow especially on MacOS. The ADD and COPY instructions are a LOT faster and
workaround this problem.

This also allows docker layer cache to speed up your executions e.g. for terraform modules that build some code as part
of the apply.

### Why making a difference between docker/local?

Docker in Docker is leading to a lot more problems and is a workaround itself. In most cases we already run in docker
context due to an CI pipeline etc.
So it makes sense to distinguish and make things easier and faster.

## Modules

The project is split into multiple modules, each contains a guide on how to develop/test:

- [core](./core) - Contains the core logic of rind
- [terraform](./terraform) - Terraform module
- [installer](./installer) - "curl-able" installer
