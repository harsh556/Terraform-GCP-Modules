variable "autopilot_cluster" {
  type = map(object({
    project_id                     = string
    cluster_name                   = string
    region                         = string
    release_channel                = string
    master_authorized_ranges       = map(string)
    private_endpoint_subnetwork    = optional(string,null)
    private_endpoint_global_access = optional(bool, false)
    enable_private_nodes           = optional(bool,true)
    enable_binary_authorization    = optional(bool,true)
    pods_range_name                = string
    services_range_name            = string
    min_master_version             = optional(string)
    deletion_protection            = optional(bool,false)
    labels                         = optional(map(string)) # Map of labels
    network_self_link              = string
    subnet_self_link               = string
    service_account                = string
    istio = optional(object({
      enable_tls = bool
    }), null)
    cost_management   = optional(bool, false) 
    gateway_api       = optional(bool, false) 
    mesh_certificates = optional(bool, false) 
    vertical_pod_autoscaling = optional(bool, false)
  }))
  description = "Map of Autopilot cluster configurations"
}