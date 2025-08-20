module "net_lb_proxy_int" {
  source   = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-proxy-int?ref=v39.0.0" 
  for_each = var.net_lb_proxy_int_config

 
  project_id = each.value.project_id
  region     = each.value.region
  name       = each.value.name
  vpc_config = each.value.vpc_config


  description              = each.value.description
  address                  = each.value.address
  global_access            = each.value.global_access
  backend_service_config   = each.value.backend_service_config
  group_configs            = each.value.group_configs
  health_check             = each.value.health_check
  health_check_config      = each.value.health_check_config
  labels                   = each.value.labels
  neg_configs              = each.value.neg_configs
  port                     = each.value.port
  service_attachment       = each.value.service_attachment
}