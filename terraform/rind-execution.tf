locals {
  main_cmd  = var.main_cmd == null ? "" : "--main-cmd \"${var.main_cmd}\""
  setup_cmd = var.setup_cmd == null ? "" : "--setup-cmd \"${var.setup_cmd}\""
  runtime   = var.runtime == null ? "" : "--runtime \"${var.runtime}\""
  artifacts = var.artifacts == null || length(var.artifacts) == 0 ? "" : "--artifacts \"${join(",", var.artifacts)}\""
  suffix    = var.suffix == null ? "" : "--suffix \"${var.suffix}\""

  log_level  = " --log-level \"${var.log_level}\""
  pwd        = " --pwd \"${coalesce(var.pwd, path.root)}\""
  script_url = "https://raw.githubusercontent.com/timo-reymann/poc-rind/${var.git_ref}/core/rind"
}

resource "null_resource" "this" {
  provisioner "local-exec" {
    command     = "curl -sS ${local.script_url} | bash -s - ${local.main_cmd} ${local.setup_cmd} ${local.log_level} ${local.runtime} ${local.artifacts} ${local.suffix} ${local.pwd}"
    interpreter = ["bash", "-c"]
  }
}
