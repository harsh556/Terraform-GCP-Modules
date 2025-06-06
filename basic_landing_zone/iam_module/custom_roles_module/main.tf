module "proj_cust_role" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project?ref=v39.0.0"
  for_each       = var.custom_roles
  project_reuse = {
    use_data_source = true
  }
  name           = each.value.project_id
  custom_roles = {
    "${each.value.custom_role_name}" = each.value.role_permissions
  }
  iam = {
    format("projects/%s/roles/%s", each.value.project_id, each.value.custom_role_name) = each.value.iam_principal
  }
}
