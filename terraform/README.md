terraform
===

Terraform module to use rind for your workflows and modules.

# Usage

Simply include the following terraform code in your project.

Always check [the repo releases](https://github.com/timo-reymann/rind/releases) for the latest available version and
replace the ref version in the code snippet below accordingly.

```hcl
/*
Assuming the following directory structure:
.
├─ main.tf
|- build.tf
├─ versions.tf
├─ variables.tf
├─ code/
    ├─ handler.py
    ├─ util.py
    |- Makefile
*/

# build.tf
module "build_code" {
  source    = "github.com/timo-reymann/rind//terraform?ref=1.0.0"
  runtime   = "cimg/python:3.9"
  setup_cmd = "make install-dependencies"
  pwd       = "code"
  main_cmd  = "make build"
  artifacts = [
    "dist/" # assuming the build command will produce a dist folder
  ]
  git_ref = "main" # You can use branches, tags or even git hashes (which i strongly recommend to be 100% sure the code is always the same)
}
```

# Module documentation
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.this](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifacts"></a> [artifacts](#input\_artifacts) | Artifact paths to keep. | `set(string)` | `[]` | no |
| <a name="input_git_ref"></a> [git\_ref](#input\_git\_ref) | Git ref for script to use | `string` | `"main"` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level to use for outputs. | `string` | `"INFO"` | no |
| <a name="input_main_cmd"></a> [main\_cmd](#input\_main\_cmd) | Main command to execute. This contains the primary logic. | `string` | n/a | yes |
| <a name="input_pwd"></a> [pwd](#input\_pwd) | Working directory to use, defaults to `path.root`. | `string` | `null` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime to use for base image, must be a valid docker image uri. | `string` | `null` | no |
| <a name="input_setup_cmd"></a> [setup\_cmd](#input\_setup\_cmd) | Setup command to execute. This one is cached with docker locally and is intended for setup tasks. | `string` | `null` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Custom suffix to use for docker resources. Should be unique across projects that are executed on the same host. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Development

## Requirements

- [pre-commit](https://pre-commit.com/)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)
- [terraform](https://www.terraform.io/)
- [tfsec](https://tfsec.dev/)
- [tflint](https://github.com/terraform-linters/tflint)

## Testing

Tests are executed using terratest, ensuring the module works in common constellations.

```bash
make install-dependencies
make test
```
