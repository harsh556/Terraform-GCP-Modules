module "nlb" {
  source                  = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-ext"
  for_each                = var.enable_net_lb_creation ? var.net-lb-ext : {}
  project_id              = each.value.project_id
  region                  = each.value.region
  backend_service_config  = each.value.backend_service_config
  name                    = each.value.name
  description             = each.value.description
  backends                = each.value.backends
  forwarding_rules_config = each.value.forwarding_rules_config
  health_check            = each.value.health_check
  health_check_config     = each.value.health_check_config
  group_configs           = each.value.group_configs
}