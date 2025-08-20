variable "enable_net_lb_creation" {
  description = "enable Nw LB creation"
  type        = bool
  default     = true
}

variable "net-lb-ext" {
  type = map(object({
    project_id   = string
    region       = string
    name         = string
    description  = optional(string)
    health_check = optional(string, null)
    labels       = map(string)
    backend_service_config = optional(object({
      connection_draining_timeout_sec = optional(number)
      connection_tracking = optional(object({
        idle_timeout_sec          = optional(number)
        persist_conn_on_unhealthy = optional(string)
        track_per_session         = optional(bool)
      }))
      failover_config = optional(object({
        disable_conn_drain        = optional(bool)
        drop_traffic_if_unhealthy = optional(bool)
        ratio                     = optional(number)
      }))
      locality_lb_policy = optional(string)
      name               = optional(string)
      port_name          = optional(string)
      log_sample_rate    = optional(number)
      protocol           = optional(string, "UNSPECIFIED")
      session_affinity   = optional(string)
      timeout_sec        = optional(number)
    }), {})

    backends = list(object({
      group       = string
      description = optional(string, "Terraform managed.")
      failover    = optional(bool, false)
    }))

    forwarding_rules_config = optional(map(object({
      address     = optional(string)
      description = optional(string)
      ipv6        = optional(bool, false)
      name        = optional(string)
      ports       = optional(list(string), null)
      protocol    = optional(string, "TCP")
      subnetwork  = optional(string) # Required for IPv6
    })), {})

    group_configs = optional(map(object({
      zone        = string
      instances   = optional(list(string))
      named_ports = optional(map(number), {})
    })), {})

    health_check_config = optional(object({
      check_interval_sec  = optional(number)
      description         = optional(string, "Terraform managed.")
      enable_logging      = optional(bool, false)
      healthy_threshold   = optional(number)
      name                = optional(string)
      timeout_sec         = optional(number)
      unhealthy_threshold = optional(number)
      grpc = optional(object({
        port               = optional(number)
        port_name          = optional(string)
        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT
        service_name       = optional(string)
      }))
      http = optional(object({
        host               = optional(string)
        port               = optional(number)
        port_name          = optional(string)
        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT
        proxy_header       = optional(string)
        request_path       = optional(string)
        response           = optional(string)
      }))
      http2 = optional(object({
        host               = optional(string)
        port               = optional(number)
        port_name          = optional(string)
        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT
        proxy_header       = optional(string)
        request_path       = optional(string)
        response           = optional(string)
      }))
      https = optional(object({
        host               = optional(string)
        port               = optional(number)
        port_name          = optional(string)
        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT
        proxy_header       = optional(string)
        request_path       = optional(string)
        response           = optional(string)
      }))
      tcp = optional(object({
        port               = optional(number)
        port_name          = optional(string)
        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT
        proxy_header       = optional(string)
        request            = optional(string)
        response           = optional(string)
      }))
      ssl = optional(object({
        port               = optional(number)
        port_name          = optional(string)
        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT
        proxy_header       = optional(string)
        request            = optional(string)
        response           = optional(string)
      }))
    }))
  }))
}