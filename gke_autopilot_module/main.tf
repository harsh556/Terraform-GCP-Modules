module "autopilot_cluster" {
  source          = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/gke-cluster-autopilot?ref=v39.0.0"
  for_each        = var.autopilot_cluster
  project_id      = each.value.project_id
  name            = each.value.cluster_name
  location        = each.value.region
  release_channel = each.value.release_channel
  access_config = {
    ip_access = {
      authorized_ranges = each.value.master_authorized_ranges
      private_endpoint_config = {
        endpoint_subnetwork = each.value.private_endpoint_subnetwork
        global_access       = each.value.private_endpoint_global_access
      }
    }
    private_nodes = each.value.enable_private_nodes
  }
  vpc_config = {
    network    = each.value.network_self_link
    subnetwork = each.value.subnet_self_link
    secondary_range_names = {
      pods     = each.value.pods_range_name
      services = each.value.services_range_name
    }
  }
  min_master_version  = each.value.min_master_version
  deletion_protection = each.value.deletion_protection
  labels              = each.value.labels
  node_config = {
    service_account = each.value.service_account
  }
  enable_addons = {
    istio = each.value.istio
  }
  enable_features = {
    binary_authorization = each.value.enable_binary_authorization
    cost_management      = each.value.cost_management
    gateway_api          = each.value.gateway_api
    mesh_certificates    = each.value.mesh_certificates
    vertical_pod_autoscaling  = each.value.vertical_pod_autoscaling
  }
}
# tftest modules=1 resources=1 inventory=basic.yaml