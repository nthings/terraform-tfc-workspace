<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.31 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.complex_workspace_variables](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.workspace_variables_lists_hcl](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.workspace_variables_maps_hcl](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.workspace_variables_non_hcl](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Set this to false if you don't want to auto apply the workspace. | `bool` | `true` | no |
| <a name="input_complex_workspace_variables"></a> [complex\_workspace\_variables](#input\_complex\_workspace\_variables) | Complex types variables to save on the workspace. Ex: maps with n levels are saved as string | `map` | `{}` | no |
| <a name="input_global_remote_state"></a> [global\_remote\_state](#input\_global\_remote\_state) | Set this to false if you don't want to share the state on your organization. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the platform | `string` | n/a | yes |
| <a name="input_oauth_token_id"></a> [oauth\_token\_id](#input\_oauth\_token\_id) | TFE OAuth token id to authenticate to VCS provider. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the organization in TFE | `string` | n/a | yes |
| <a name="input_tag_names"></a> [tag\_names](#input\_tag\_names) | Workspace tags. | `list(string)` | `[]` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform version that the workspace will use to plan and apply | `string` | `"~> 1.2.0"` | no |
| <a name="input_trigger_prefixes"></a> [trigger\_prefixes](#input\_trigger\_prefixes) | Other workspaces that triggers the apply on the created workspace. | `list(string)` | `[]` | no |
| <a name="input_vcs_branch"></a> [vcs\_branch](#input\_vcs\_branch) | Branch in VCS repo that will be tracked by TFE. | `string` | `"main"` | no |
| <a name="input_vcs_identifier"></a> [vcs\_identifier](#input\_vcs\_identifier) | VCS Repository to be tracked by TFE. | `string` | n/a | yes |
| <a name="input_workspace_variables"></a> [workspace\_variables](#input\_workspace\_variables) | Variables to save on the workspace. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfe_workspace_id"></a> [tfe\_workspace\_id](#output\_tfe\_workspace\_id) | n/a |
<!-- END_TF_DOCS -->