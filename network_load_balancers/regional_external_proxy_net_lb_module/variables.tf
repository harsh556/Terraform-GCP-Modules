variable "tcp_proxy_lb_config" {
  description = "Configuration for External TCP Proxy Load Balancer in a map format."
  type = map(object({
    
    name           = string
    project        = string
    region         = string
    network        = string
    port_front_end = number
    backend = object({
      port             = optional(number)
      port_name        = optional(string)
      description      = optional(string)
      backend_type     = string # INSTANCE_GROUP, NETWORK_ENDPOINT_GROUP
      session_affinity = optional(string)
      timeout_sec      = optional(number)
      log_config = object({
        enable      = optional(bool)
        sample_rate = optional(number)
      })
      groups = list(object({
        group                       = string
        balancing_mode              = optional(string)
        capacity_scaler             = optional(number)
        description                 = optional(string)
        max_connections             = optional(number)
        max_connections_per_instance = optional(number)
        max_connections_per_endpoint = optional(number)
        max_rate                    = optional(number)
        max_rate_per_instance        = optional(number)
        max_rate_per_endpoint        = optional(number)
        max_utilization             = optional(number)
      }))
    })
    health_check = object({
      check_interval_sec  = optional(number)
      healthy_threshold   = optional(number)
      timeout_sec         = optional(number)
      unhealthy_threshold = optional(number)
      tcp_health_check = object({
        request            = optional(string)
        response           = optional(string)
        port               = optional(number)
        port_name          = optional(string)
        port_specification = optional(string)
        proxy_header       = optional(string)
      })
    })

    # Optional Variables
    network_project          = optional(string)
    create_firewall_rules    = optional(bool, false)
    target_tags              = optional(list(string), [])
    address                  = optional(string)
    create_proxy_only_subnet = optional(bool, false)
    proxy_only_subnet_cidr   = optional(string)
    proxy_header             = optional(string, "NONE")
  }))
}