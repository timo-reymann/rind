SHELL := /bin/bash
.PHONY: help

help: ## Display this help page
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'

install-dependencies: ## Install dependencies
	npm install -g bats

test-host: ## Run bats tests on the host
	@BATS_BASE_DIR=$(PWD)/tests BATS_RIND_BIN=$(PWD)/rind bats tests

test-docker: ## Run tests in docker container
	@echo "▶️ Execute tests in docker"
	@docker build -q -t rind-tests -f tests/container/Dockerfile .
	@docker run --rm  rind-tests

test: test-host test-docker ## Run test suite against host and inside docker container
