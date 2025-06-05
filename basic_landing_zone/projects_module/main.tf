module "project" {
  source   = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/project?ref=v39.0.0"
  for_each = var.projects

  name                = each.value.project_name
  parent              = each.value.parent_id
  prefix              = each.value.prefix
  services            = each.value.enable_apis
  billing_account     = each.value.billing_account_id
  labels              = each.value.labels
  auto_create_network = each.value.auto_create_network
  deletion_policy     = each.value.deletion_policy

  # if the code was just needed for enabling APIs, uncomment the part below and can remove the parent arg
  # project_reuse = {
  #   use_data_source = true
  # }
}
