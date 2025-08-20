module "gar" {
  source                 = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/artifact-registry?ref=v39.0.0"
  for_each               = var.gar_config
  project_id             = each.value.project_id
  name                   = each.value.name
  location              = each.value.location
  labels                 = each.value.labels
  description            = each.value.description
  encryption_key         = each.value.encryption_key
  format                   = each.value.format
  cleanup_policy_dry_run = each.value.cleanup_policy_dry_run
  cleanup_policies       = each.value.cleanup_policies
}