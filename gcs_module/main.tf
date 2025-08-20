module "bucket" {
  source                      = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/gcs?ref=v39.0.0"
  for_each                    = var.gcs_config
  project_id                  = each.value.project_id
  prefix                      = each.value.prefix
  name                        = each.value.name
  location                    = each.value.location
  versioning                  = each.value.versioning
  public_access_prevention    = each.value.public_access_prevention
  lifecycle_rules             = each.value.lifecycle_rules
  retention_policy            = each.value.retention_policy
  soft_delete_retention       = each.value.soft_delete_retention
  uniform_bucket_level_access = each.value.uniform_bucket_level_access
  labels                      = each.value.labels
}

