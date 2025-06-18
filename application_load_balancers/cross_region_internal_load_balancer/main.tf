module "ilb-l7" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-app-int-cross-region?ref=v39.0.0"
  for_each   = var.internal_regional_lb
  name       = each.value.name
  project_id = each.value.project_id
  backend_service_configs = merge(
    { for backend in each.value.backends : backend.name => {
      backends = [{
        balancing_mode = backend.type == "neg" ? "RATE" : "UTILIZATION"
        group          = backend.type == "neg" ? "projects/${each.value.project_id}/zones/${backend.zone}/networkEndpointGroups/${backend.name}" : "projects/${each.value.project_id}/zones/${backend.zone}/instanceGroups/${backend.name}"
        max_rate       = backend.type == "neg" ? { per_endpoint = 1 } : { per_endpoint = 0 }
      }]
      }
    }
  )
  protocol = each.value.protocol
  https_proxy_config = each.value.protocol == "HTTPS" ? {
    certificate_manager_certificates = [
      for cert in each.value.cert_name :
      "projects/${each.value.project_id}/locations/global/certificates/${cert}"
    ]
  } : {}
  vpc_config = {
    network     = "projects/${each.value.project_id}/global/networks/${each.value.vpc_config.network}"
    subnetworks = each.value.vpc_config.subnetworks
  }
  urlmap_config = each.value.urlmap_config
}
