module "ilb-l7" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-app-int?ref=v39.0.0"
  for_each   = var.internal_regional_lb
  name       = each.value.name
  project_id = each.value.project_id
  region     = each.value.region
  backend_service_configs = merge(
    {
      for backend in each.value.backends : backend.name => {
        backends = [{
          balancing_mode = backend.type == "neg" ? "RATE" : "UTILIZATION"
          group = backend.type == "neg" ? "projects/${each.value.project_id}/zones/${each.value.zone}/networkEndpointGroups/${backend.name}" : "projects/${each.value.project_id}/zones/${each.value.zone}/instanceGroups/${backend.name}"
          max_rate = backend.type == "neg" ? { per_endpoint = 1 } : { per_endpoint = 0 }
        }]
      }
    }
  )
  protocol = each.value.protocol
  ssl_certificates = each.value.protocol == "HTTPS" ? {
    certificate_ids = [
      for cert in each.value.cert_name :
      "projects/${each.value.project_id}/regions/${each.value.region}/sslCertificates/${cert}"
    ]
  } : {}
  vpc_config = {
    network    = each.value.network
    subnetwork = each.value.sub_network
  }
  urlmap_config = each.value.urlmap_config
}
