module "ralb-0" {
  source                  = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-app-ext-regional?ref=v39.0.0"
  for_each                = var.enable_ext_regional_app_lb_creation ? var.app-lb-ext : {}
  address                 = each.value.address
  description             = each.value.description
  group_configs           = each.value.group_configs
  https_proxy_config      = each.value.https_proxy_config
  labels                  = each.value.labels
  name                    = each.value.name
  neg_configs             = each.value.neg_configs
  network_tier_standard   = each.value.network_tier_standard
  ports                   = each.value.ports
  project_id              = each.value.project_id
  protocol                = each.value.protocol
  region                  = each.value.region
  ssl_certificates        = each.value.ssl_certificates
  vpc                     = each.value.vpc
  health_check_configs    = each.value.health_check_configs
  backend_service_configs = each.value.backend_service_configs
  urlmap_config           = each.value.urlmap_config
}

# tftest modules=3 resources=12 fixtures=fixtures/compute-vm-group-bc.tf e2e