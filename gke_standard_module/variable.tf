variable "standard_cluster" {
  type = map(object({
    project_id                     = string
    cluster_name                   = string
    region                         = string
    release_channel                = string
    max_pods_per_node              = optional(number, 110)
    master_authorized_ranges       = map(string)
    private_endpoint_subnetwork    = optional(string, null)
    private_endpoint_global_access = optional(bool, false)
    enable_private_nodes           = optional(bool, true)
    enable_binary_authorization    = optional(bool, true)
    pods_range_name                = string
    services_range_name            = string
    min_master_version             = optional(string)
    deletion_protection            = optional(bool,false)
    labels                         = map(string) # Map of labels
    network_self_link                  = string
    subnet_self_link               = string
    service_account                = string
    horizontal_pod_autoscaling     = optional(bool, false)
    http_load_balancing            = optional(bool, false)
    istio = optional(object({
      enable_tls = bool
    }), null)
    cost_management          = optional(bool, false)
    gateway_api              = optional(bool, false)
    mesh_certificates        = optional(bool, false)
    vertical_pod_autoscaling = optional(bool, false)
    workload_identity        = optional(bool, true)
    cluster_autoscaling = optional(object({
      enabled             = optional(bool)
      autoscaling_profile = optional(string, "BALANCED")
      auto_provisioning_defaults = optional(object({
        boot_disk_kms_key = optional(string)
        disk_size         = optional(number)
        disk_type         = optional(string, "pd-standard")
        image_type        = optional(string)
        oauth_scopes      = optional(list(string))
        service_account   = optional(string)
        management = optional(object({
          auto_repair  = optional(bool, true)
          auto_upgrade = optional(bool, true)
        }))
        shielded_instance_config = optional(object({
          integrity_monitoring = optional(bool, true)
          secure_boot          = optional(bool, false)
        }))
        upgrade_settings = optional(object({
          blue_green = optional(object({
            node_pool_soak_duration = optional(string)
            standard_rollout_policy = optional(object({
              batch_percentage    = optional(number)
              batch_node_count    = optional(number)
              batch_soak_duration = optional(string)
            }))
          }))
          surge = optional(object({
            max         = optional(number)
            unavailable = optional(number)
          }))
        }))
        # add validation rule to ensure only one is present if upgrade settings is defined
      }), null)
      cpu_limits = optional(object({
        min = optional(number, 0)
        max = number
      }))
      mem_limits = optional(object({
        min = optional(number, 0)
        max = number
      }))
      accelerator_resources = optional(list(object({
        resource_type = string
        min           = optional(number, 0)
        max           = number
      })))
    }), null)
  }))
  description = "Map of Autopilot cluster configurations"
}