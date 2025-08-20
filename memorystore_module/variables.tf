/******************************************
  Variables for MemoryStore Instance
 *****************************************/

variable "enable_memorystore_creation" {
  description = "enable memorystore creation"
  type        = bool
  default     = true
}

variable "memorystore" {
  type = map(object({
    project_id              = string
    instance_name           = string
    shard_count             = number
    region                  = string
    replica_count           = optional(number, 0)
    transit_encryption_mode = optional(string)
    authorization_mode      = optional(string, "AUTH_MODE_DISABLED")
    node_type               = string
    redis_configs = optional(object({
      maxmemory-clients       = optional(string)
      maxmemory               = optional(string)
      maxmemory-policy        = optional(string)
      notify-keyspace-events  = optional(string)
      slowlog-log-slower-than = optional(number)
      maxclients              = optional(number)
    }))
    service_connection_policies = map(object({
      description     = optional(string)
      network_name    = string
      network_project = string
      subnet_names    = list(string)
      limit           = optional(number)
      labels          = optional(map(string), {})
    }))
    # List of consumer network where the network address of the discovery endpoint will be reserved. Currently, only one item is supported.
    network                       = list(string)
    zone_distribution_config_mode = optional(string, "MULTI_ZONE")
    zone_distribution_config_zone = optional(string, null)
    deletion_protection_enabled   = optional(bool, false)

    labels = optional(map(string))


  }))
}