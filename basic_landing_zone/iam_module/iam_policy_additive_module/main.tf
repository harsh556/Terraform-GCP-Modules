module "additive_policy" {
  source                = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project?ref=v39.0.0"
  for_each              = var.additive_policy
  name                  = each.value.project_id
  project_reuse = {
    use_data_source = true
  }
  iam_bindings_additive = each.value.iam_bindings_additive
}
