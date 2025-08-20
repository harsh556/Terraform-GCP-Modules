module "bucket" {
  source      = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/logging-bucket?ref=v39.0.0"
  for_each    = var.logging_bucket
  parent_type = each.value.parent_type
  parent      = each.value.parent_id
  id          = each.value.bucket_name
  log_analytics = {
    enable          = each.value.enable_log_analytics
    dataset_link_id = each.value.dataset_link_id
  }
}
# tftest modules=1 resources=2 inventory=log_analytics.yaml
