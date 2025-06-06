module "policy" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project?ref=v39.0.0"
  for_each       = var.policy_by_principal
  name           = each.value.project_id
  project_reuse = {
    use_data_source = true
  }
  iam_by_principals = {
    "${each.value.principal}" = each.value.roles
  }
}
