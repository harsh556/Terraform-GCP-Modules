variable "net_lb_proxy_int_config" {
  description = "Configuration for Internal Load Balancer (ILB) in a map format."
  type = map(object({
  
    project_id = string
    region     = string
    name       = string
    vpc_config = object({
      network    = string
      subnetwork = string
    })

    # Optional Variables
    description     = optional(string, "Terraform managed.")
    address         = optional(string)
    global_access   = optional(bool)
    backend_service_config = optional(object({
      affinity_cookie_ttl_sec         = optional(number)
      connection_draining_timeout_sec = optional(number)
      health_checks                   = optional(list(string), ["default"])
      log_sample_rate                 = optional(number)
      port_name                       = optional(string)
      session_affinity                = optional(string, "NONE")
      timeout_sec                     = optional(number)
      backends = optional(list(object({
        group           = string
        balancing_mode  = optional(string, "UTILIZATION")
        capacity_scaler = optional(number, 1)
        description     = optional(string, "Terraform managed.")
        failover        = optional(bool, false)
        max_connections = optional(object({
          per_endpoint = optional(number)
          per_group    = optional(number)
          per_instance = optional(number)
        }))
        max_utilization = optional(number)
      })))
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
    }), {})
    group_configs = optional(map(object({
      zone        = string
      instances   = optional(list(string))
      named_ports = optional(map(number), {})
      project_id  = optional(string)
    })), {})
    health_check        = optional(string)
    health_check_config = optional(object({
      check_interval_sec  = optional(number)
      description         = optional(string, "Terraform managed.")
      enable_logging      = optional(bool, false)
      healthy_threshold   = optional(number)
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
    }), {})
    labels = optional(map(string), {})
    neg_configs = optional(map(object({
      project_id = optional(string)
      gce = optional(object({
        zone        = string
        network     = optional(string)
        subnetwork  = optional(string)
        endpoints   = optional(map(object({
          instance   = string
          ip_address = string
          port       = number
        })))
      }))
      hybrid = optional(object({
        zone        = string
        network     = optional(string)
        endpoints   = optional(map(object({
          ip_address = string
          port       = number
        })))
      }))
      internet = optional(object({
        region      = string
        use_fqdn    = optional(bool, true)
        endpoints   = optional(map(object({
          destination = string
          port        = number
        })))
      }))
      psc = optional(object({
        region         = string
        target_service = string
        network        = optional(string)
        subnetwork     = optional(string)
      }))
    })), {})
    port = optional(number, 80)
    service_attachment = optional(object({
      nat_subnets           = list(string)
      automatic_connection  = optional(bool, false)
      consumer_accept_lists = optional(map(string), {})
      consumer_reject_lists = optional(list(string))
      description           = optional(string)
      domain_name           = optional(string)
      enable_proxy_protocol = optional(bool, false)
      reconcile_connections = optional(bool)
    }),null)
  }))
}