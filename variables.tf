variable "name" {
  description = "Name of the platform"
  type        = string
}

variable "organization" {
  description = "Name of the organization in TFC"
  type        = string
}

variable "terraform_version" {
  description = "Terraform version that the workspace will use to plan and apply"
  type        = string
  default     = "~> 1.2.0"
}

variable "tag_names" {
  type        = list(string)
  default     = []
  description = "Workspace tags."
}

variable "global_remote_state" {
  type        = bool
  default     = true
  description = "Set this to false if you don't want to share the state on your organization."
}

variable "auto_apply" {
  type        = bool
  default     = true
  description = "Set this to false if you don't want to auto apply the workspace."
}

variable "trigger_prefixes" {
  type        = list(string)
  default     = []
  description = "Other workspaces that triggers the apply on the created workspace."
}

variable "vcs_branch" {
  description = "Branch in VCS repo that will be tracked by TFE."
  type        = string
  default     = "main"
}

variable "vcs_identifier" {
  description = "VCS Repository to be tracked by TFE."
  type        = string
}

variable "oauth_token_id" {
  description = "TFE OAuth token id to authenticate to VCS provider."
  type        = string
}

variable "workspace_variables" {
  default     = {}
  description = "Variables to save on the workspace."
}

variable "complex_workspace_variables" {
  default     = {}
  description = "Complex types variables to save on the workspace. Ex: maps with n levels are saved as string"
}
