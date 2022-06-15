locals {
  workspace_variables_non_hcl   = { for key, value in var.workspace_variables : key => value if can(tostring(value)) || can(tonumber(value)) }
  workspace_variables_maps_hcl  = { for key, value in var.workspace_variables : key => tomap(value) if can(tomap(value)) }
  workspace_variables_lists_hcl = { for key, value in var.workspace_variables : key => tolist(value) if can(tolist(value)) }
  complex_workspace_variables   = { for key, value in var.complex_workspace_variables : key => value }
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

resource "tfe_variable" "workspace_variables_maps_hcl" {
  for_each     = local.workspace_variables_maps_hcl
  key          = each.key
  value        = <<EOT
                  {
                    %{for key, value in each.value~}

                    %{if can(tolist(value))~}
                      ${key} = "${jsonencode(value)}"
                    %{endif~}

                    %{if can(tostring(value))~}
                      ${key} = "${value}"
                    %{endif~}

                    %{if can(tonumber(value))~}
                      ${key} = ${value}
                    %{endif~}

                    %{endfor~}
                  }
                  EOT
  category     = "terraform"
  hcl          = true
  workspace_id = tfe_workspace.this.id
  sensitive    = false
}

resource "tfe_variable" "complex_workspace_variables" {
  for_each     = local.complex_workspace_variables
  key          = each.key
  value        = jsonencode(each.value)
  category     = "terraform"
  hcl          = false
  workspace_id = tfe_workspace.this.id
  sensitive    = false
}

resource "tfe_variable" "workspace_variables_lists_hcl" {
  for_each     = local.workspace_variables_lists_hcl
  key          = each.key
  value        = jsonencode(each.value)
  category     = "terraform"
  hcl          = true
  workspace_id = tfe_workspace.this.id
  sensitive    = false
}
