module "cluster-nodepool" {
  source       = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/gke-nodepool?ref=v39.0.0"
  for_each     = var.gke_nodepool
  project_id   = each.value.project_id
  cluster_name = each.value.cluster_name
  location     = each.value.location
  name         = each.value.nodepool_name
  k8s_labels   = each.value.k8s_labels
  taints       = each.value.taints
  service_account = {
    create = false
    email  = each.value.service_account_email
  }
  node_config = each.value.node_config
  pod_range = {
    secondary_pod_range = {
      name                 = each.value.secondary_pod_range_name
      create               = false
      enable_private_nodes = true
    }
  }
  nodepool_config = {
    autoscaling = each.value.autoscaling
    management = {
      auto_repair  = true
      auto_upgrade = true
    }
  }
}
