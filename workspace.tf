resource "tfe_workspace" "this" {
  name                = var.name
  organization        = var.organization
  terraform_version   = var.terraform_version
  tag_names           = var.tag_names
  global_remote_state = var.global_remote_state
  auto_apply          = var.auto_apply
  trigger_prefixes    = var.trigger_prefixes
  vcs_repo {
    branch         = var.vcs_branch
    identifier     = var.vcs_identifier
    oauth_token_id = var.oauth_token_id
  }
}
