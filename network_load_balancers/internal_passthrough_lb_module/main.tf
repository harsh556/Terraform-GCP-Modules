# Calling module for Internal Load Balancer (ILB)
module "ilb" {
  source   = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-int?ref=v39.0.0"

  for_each = var.ilb_config
  project_id = each.value.project_id
  region     = each.value.region
  name       = each.value.name
  vpc_config = each.value.vpc_config

  
  description              = each.value.description
  backend_service_config   = each.value.backend_service_config
  backends                 = each.value.backends
  forwarding_rules_config  = each.value.forwarding_rules_config
  group_configs            = each.value.group_configs
  health_check             = each.value.health_check
  health_check_config      = each.value.health_check_config
  labels                   = each.value.labels
  service_attachments      = each.value.service_attachments
  service_label            = each.value.service_label
}