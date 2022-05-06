SHELL := /bin/bash
.PHONY: help

help: ## Display this help page
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'

install-dependencies: ## Install dependencies
	go install github.com/terraform-docs/terraform-docs@v0.16.0
	@cd tests/ && \
	go mod download

test: ## Run terratest
	@cd tests/ && \
	go test -v
