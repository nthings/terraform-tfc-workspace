locals {
  workspace_variables_non_hcl = { for key, value in var.workspace_variables : key => value if can(tostring(value)) || can(tonumber(value)) }
}

resource "tfe_variable" "workspace_variables_non_hcl" {
  for_each     = local.workspace_variables_non_hcl
  key          = each.key
  value        = each.value
  category     = "terraform"
  hcl          = false
  workspace_id = tfe_workspace.this.id
  sensitive    = false
}

# resource "tfe_variable" "workspace_variables_hcl" {
#   for_each     = { for key, value in var.workspace_variables : key => value if !can(tostring(value)) }
#   key          = each.key
#   value        = <<EOT
#                   {
#                     %{for key, value in each.value~}
#                     ${key} = "${value}"
#                     %{endfor~}
#                   }
#                   EOT
#   category     = "terraform"
#   hcl          = true
#   workspace_id = tfe_workspace.this.id
#   sensitive    = false
# }
