module "memorystore" {

  source                      = "github.com/terraform-google-modules/terraform-google-memorystore/modules/redis-cluster?ref=v14.0.0"
  for_each                    = var.enable_memorystore_creation ? var.memorystore : {}
  project_id                  = each.value.project_id
  name                        = each.value.instance_name
  shard_count                 = each.value.shard_count
  region                      = each.value.region
  replica_count               = each.value.replica_count
  transit_encryption_mode     = each.value.transit_encryption_mode
  authorization_mode          = each.value.authorization_mode
  node_type                   = each.value.node_type
  redis_configs               = each.value.redis_configs
  deletion_protection_enabled = each.value.deletion_protection_enabled
  network = [
    for i in each.value.network :
    "projects/${each.value.project_id}/global/networks/${i}}"
  ]
  // Configuration 
  zone_distribution_config_mode = each.value.zone_distribution_config_mode
  zone_distribution_config_zone = each.value.zone_distribution_config_zone


  service_connection_policies = each.value.service_connection_policies
  ## custmer managed key option shouldn't be given
}
