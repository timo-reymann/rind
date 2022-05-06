variable "pwd" {
  description = "Working directory to use, defaults to `path.root`."
  type        = string
  default     = null
}

variable "artifacts" {
  description = "Artifact paths to keep."
  type        = set(string)
  default     = []
}

variable "log_level" {
  description = "Log level to use for outputs."
  default     = "INFO"
  type        = string
}

variable "main_cmd" {
  description = "Main command to execute. This contains the primary logic."
  type        = string
}

variable "runtime" {
  description = "Runtime to use for base image, must be a valid docker image uri."
  default     = null
  type        = string
}

variable "setup_cmd" {
  description = "Setup command to execute. This one is cached with docker locally and is intended for setup tasks."
  default     = null
  type        = string
}

variable "suffix" {
  description = "Custom suffix to use for docker resources. Should be unique across projects that are executed on the same host."
  default     = null
  type        = string
}

variable "git_ref" {
  description = "Git ref for script to use"
  default     = "main"
  type        = string
}
