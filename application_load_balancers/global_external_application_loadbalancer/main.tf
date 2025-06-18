module "glb-0" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-app-ext?ref=v39.0.0"
  for_each = var.global_lb
  project_id = each.value.project_id
  name       = each.value.name
  backend_buckets_config = each.value.bucket != null ? {
    default = {
      bucket_name = each.value.bucket
    }
  } : {}
  backend_service_configs = merge(
    { for backend in each.value.backends : backend.name => {
      backends = [{
        balancing_mode = backend.type == "neg" ? "RATE" : "UTILIZATION"
        backend          = backend.type == "neg" ? "projects/${each.value.project_id}/zones/${backend.zone}/networkEndpointGroups/${backend.name}" : "projects/${each.value.project_id}/zones/${backend.zone}/instanceGroups/${backend.name}"
        max_rate       = backend.type == "neg" ? { per_endpoint = 1 } : { per_endpoint = 0 }
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
  urlmap_config = each.value.urlmap_config
}
