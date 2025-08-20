variable "gke_nodepool" {
  type = map(object({
    project_id    = string
    cluster_name  = string
    location      = string
    nodepool_name = string
    k8s_labels    = optional(map(string))
    taints = optional(map(object({
      value  = string
      effect = string
    })))
    network_tags          = optional(list(string))
    service_account_email = optional(string) # optional
    node_config = object({
      image_type   = string
      machine_type = string
      disk_size_gb = number
      disk_type    = string
      spot         = bool
    })
    secondary_pod_range_name = optional(string)
    autoscaling = object({
      max_node_count = number
      min_node_count = number
    })
  }))
  default = null
}
