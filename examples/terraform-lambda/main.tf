terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {

}

# ...

locals {
  filename = "code/dist/lambda.zip"
}

resource "aws_lambda_function" "this" {
  function_name    = "my-cool-lambda"
  description      = "My super cool lambda"
  handler          = "handler.handle"
  runtime          = "python3.9"
  architectures    = ["arm64"]
  role             = "" # role goes here
  filename         = local.filename
  source_code_hash = filebase64sha256(local.filename)
  # ...
  depends_on = [
    module.build
  ]
}

module "build" {
  source    = "github.com/timo-reymann/rind//terraform?ref=1.0.0"
  runtime   = "cimg/python:3.9"
  setup_cmd = "make setup"
  pwd       = "${path.module}/code"
  main_cmd  = "make build"
  artifacts = [
    "dist/"
  ]
  git_ref = "main" # for real world scenarios always use a git hash/tag
}

# ...
