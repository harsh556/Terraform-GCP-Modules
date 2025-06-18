variable "enable_ext_regional_app_lb_creation" {
  description = "enable Nw LB creation"
  type        = bool
  default     = true
}

variable "app-lb-ext" {
  type = map(object({
    address     = optional(string)
    description = optional(string)
    name        = string
    group_configs = optional(map(object({
      zone        = string
      instances   = optional(list(string))
      named_ports = optional(map(number), {})
      project_id  = optional(string)
    })), {})
    https_proxy_config = optional(object({
      certificate_manager_certificates = optional(list(string))
      certificate_map                  = optional(string)
      quic_override                    = optional(string)
      ssl_policy                       = optional(string)
    }), {})
    labels = optional(map(string), {})
    neg_configs = optional(map(object({
      description = optional(string)
      cloudfunction = optional(object({
        region          = string
        target_function = optional(string)
      }))
      cloudrun = optional(object({
        region = string
        target_service = optional(object({
          name = string
          tag  = optional(string)
        }))
        target_urlmask = optional(string)
      }))
      gce = optional(object({
        network    = string
        subnetwork = string
        zone       = string
        # default_port = optional(number)
        endpoints = optional(map(object({
          instance   = string
          ip_address = string
          port       = number
        })))
      }))
      hybrid = optional(object({
        network = string
        zone    = string
        # re-enable once provider properly support this
        # default_port = optional(number)
        endpoints = optional(map(object({
          ip_address = string
          port       = number
        })))
      }))
      psc = optional(object({
        region         = string
        target_service = string
        network        = optional(string)
        subnetwork     = optional(string)
      }))
    })), {})
    network_tier_standard = optional(bool, true)
    ports                 = optional(list(string), null)
    project_id            = string
    protocol              = optional(string, "HTTP")
    region                = string
    ssl_certificates = optional(object({
      certificate_ids = optional(list(string), [])
      create_configs = optional(map(object({
        certificate = string
        private_key = string
      })), {})
    }))
    vpc = string
    health_check_configs = optional(map(object({
      check_interval_sec  = optional(number)
      description         = optional(string, "Terraform managed.")
      enable_logging      = optional(bool, false)
      healthy_threshold   = optional(number)
      project_id          = optional(string)
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
    })), {})
    backend_service_configs = optional(map(object({
      affinity_cookie_ttl_sec         = optional(number)
      connection_draining_timeout_sec = optional(number)
      enable_cdn                      = optional(bool)
      health_checks                   = optional(list(string), ["default"])
      log_sample_rate                 = optional(number)
      port_name                       = optional(string)
      project_id                      = optional(string)
      protocol                        = optional(string)
      security_policy                 = optional(string)
      session_affinity                = optional(string)
      timeout_sec                     = optional(number)
      backends = list(object({
        # group renamed to backend
        backend         = string
        balancing_mode  = optional(string, "UTILIZATION")
        capacity_scaler = optional(number, 1)
        description     = optional(string, "Terraform managed.")
        failover        = optional(bool, false)
        max_connections = optional(object({
          per_endpoint = optional(number)
          per_group    = optional(number)
          per_instance = optional(number)
        }))
        max_rate = optional(object({
          per_endpoint = optional(number)
          per_group    = optional(number)
          per_instance = optional(number)
        }))
        max_utilization = optional(number)
      }))
      cdn_policy = optional(object({
        cache_mode                   = optional(string)
        client_ttl                   = optional(number)
        default_ttl                  = optional(number)
        max_ttl                      = optional(number)
        negative_caching             = optional(bool)
        serve_while_stale            = optional(number)
        signed_url_cache_max_age_sec = optional(number)
        cache_key_policy = optional(object({
          include_host           = optional(bool)
          include_named_cookies  = optional(list(string))
          include_protocol       = optional(bool)
          include_query_string   = optional(bool)
          query_string_blacklist = optional(list(string))
          query_string_whitelist = optional(list(string))
        }))
        negative_caching_policy = optional(object({
          code = optional(number)
          ttl  = optional(number)
        }))
      }))
      circuit_breakers = optional(object({
        max_connections             = optional(number)
        max_pending_requests        = optional(number)
        max_requests                = optional(number)
        max_requests_per_connection = optional(number)
        max_retries                 = optional(number)
        connect_timeout = optional(object({
          seconds = number
          nanos   = optional(number)
        }))
      }))
      consistent_hash = optional(object({
        http_header_name  = optional(string)
        minimum_ring_size = optional(number)
        http_cookie = optional(object({
          name = optional(string)
          path = optional(string)
          ttl = optional(object({
            seconds = number
            nanos   = optional(number)
          }))
        }))
      }))
      iap_config = optional(object({
        oauth2_client_id            = string
        oauth2_client_secret        = string
        oauth2_client_secret_sha256 = optional(string)
      }))
      outlier_detection = optional(object({
        consecutive_errors                    = optional(number)
        consecutive_gateway_failure           = optional(number)
        enforcing_consecutive_errors          = optional(number)
        enforcing_consecutive_gateway_failure = optional(number)
        enforcing_success_rate                = optional(number)
        max_ejection_percent                  = optional(number)
        success_rate_minimum_hosts            = optional(number)
        success_rate_request_volume           = optional(number)
        success_rate_stdev_factor             = optional(number)
        base_ejection_time = optional(object({
          seconds = number
          nanos   = optional(number)
        }))
        interval = optional(object({
          seconds = number
          nanos   = optional(number)
        }))
      }))
    })), {})
    urlmap_config = optional(object({
      default_route_action = optional(object({
        request_mirror_backend = optional(string)
        cors_policy = optional(object({
          allow_credentials    = optional(bool)
          allow_headers        = optional(list(string))
          allow_methods        = optional(list(string))
          allow_origin_regexes = optional(list(string))
          allow_origins        = optional(list(string))
          disabled             = optional(bool)
          expose_headers       = optional(list(string))
          max_age              = optional(string)
        }))
        fault_injection_policy = optional(object({
          abort = optional(object({
            percentage = number
            status     = number
          }))
          delay = optional(object({
            fixed = object({
              seconds = number
              nanos   = number
            })
            percentage = number
          }))
        }))
        retry_policy = optional(object({
          num_retries      = number
          retry_conditions = optional(list(string))
          per_try_timeout = optional(object({
            seconds = number
            nanos   = optional(number)
          }))
        }))
        timeout = optional(object({
          seconds = number
          nanos   = optional(number)
        }))
        url_rewrite = optional(object({
          host          = optional(string)
          path_prefix   = optional(string)
          path_template = optional(string)
        }))
        weighted_backend_services = optional(map(object({
          weight = number
          header_action = optional(object({
            request_add = optional(map(object({
              value   = string
              replace = optional(bool, true)
            })))
            request_remove = optional(list(string))
            response_add = optional(map(object({
              value   = string
              replace = optional(bool, true)
            })))
            response_remove = optional(list(string))
          }))
        })))
      }))
      default_service = optional(string)
      default_url_redirect = optional(object({
        host          = optional(string)
        https         = optional(bool)
        path          = optional(string)
        prefix        = optional(string)
        response_code = optional(string)
        strip_query   = optional(bool, false)
      }))
      header_action = optional(object({
        request_add = optional(map(object({
          value   = string
          replace = optional(bool, true)
        })))
        request_remove = optional(list(string))
        response_add = optional(map(object({
          value   = string
          replace = optional(bool, true)
        })))
        response_remove = optional(list(string))
      }))
      host_rules = optional(list(object({
        hosts        = list(string)
        path_matcher = string
        description  = optional(string)
      })))
      path_matchers = optional(map(object({
        description     = optional(string)
        default_service = optional(string)
        default_url_redirect = optional(object({
          host          = optional(string)
          https         = optional(bool)
          path          = optional(string)
          prefix        = optional(string)
          response_code = optional(string)
          strip_query   = optional(bool)
        }))
        path_rules = optional(list(object({
          paths   = list(string)
          service = optional(string)
          route_action = optional(object({
            request_mirror_backend = optional(string)
            cors_policy = optional(object({
              allow_credentials    = optional(bool)
              allow_headers        = optional(list(string))
              allow_methods        = optional(list(string))
              allow_origin_regexes = optional(list(string))
              allow_origins        = optional(list(string))
              disabled             = optional(bool)
              expose_headers       = optional(list(string))
              max_age              = optional(string)
            }))
            fault_injection_policy = optional(object({
              abort = optional(object({
                percentage = number
                status     = number
              }))
              delay = optional(object({
                fixed = object({
                  seconds = number
                  nanos   = number
                })
                percentage = number
              }))
            }))
            retry_policy = optional(object({
              num_retries      = number
              retry_conditions = optional(list(string))
              per_try_timeout = optional(object({
                seconds = number
                nanos   = optional(number)
              }))
            }))
            timeout = optional(object({
              seconds = number
              nanos   = optional(number)
            }))
            url_rewrite = optional(object({
              host          = optional(string)
              path_prefix   = optional(string)
              path_template = optional(string)
            }))
            weighted_backend_services = optional(map(object({
              weight = number
              header_action = optional(object({
                request_add = optional(map(object({
                  value   = string
                  replace = optional(bool, true)
                })))
                request_remove = optional(list(string))
                response_add = optional(map(object({
                  value   = string
                  replace = optional(bool, true)
                })))
                response_remove = optional(list(string))
              }))
            })))
          }))
          url_redirect = optional(object({
            host          = optional(string)
            https         = optional(bool)
            path          = optional(string)
            prefix        = optional(string)
            response_code = optional(string)
            strip_query   = optional(bool)
          }))
        })))
        route_rules = optional(list(object({
          priority = number
          service  = optional(string)
          header_action = optional(object({
            request_add = optional(map(object({
              value   = string
              replace = optional(bool, true)
            })))
            request_remove = optional(list(string))
            response_add = optional(map(object({
              value   = string
              replace = optional(bool, true)
            })))
            response_remove = optional(list(string))
          }))
          match_rules = optional(list(object({
            ignore_case = optional(bool, false)
            headers = optional(list(object({
              name         = string
              invert_match = optional(bool, false)
              type         = optional(string, "present") # exact, prefix, suffix, regex, present, range, template
              value        = optional(string)
              range_value = optional(object({
                end   = string
                start = string
              }))
            })))
            metadata_filters = optional(list(object({
              labels    = map(string)
              match_all = bool
            })))
            path = optional(object({
              value = string
              type  = optional(string, "prefix") # full, prefix, regex
            }))
            query_params = optional(list(object({
              name  = string
              value = string
              type  = optional(string, "present") # exact, present, regex
            })))
          })))
          route_action = optional(object({
            request_mirror_backend = optional(string)
            cors_policy = optional(object({
              allow_credentials    = optional(bool)
              allow_headers        = optional(string)
              allow_methods        = optional(string)
              allow_origin_regexes = list(string)
              allow_origins        = list(string)
              disabled             = optional(bool)
              expose_headers       = optional(string)
              max_age              = optional(string)
            }))
            fault_injection_policy = optional(object({
              abort = optional(object({
                percentage = number
                status     = number
              }))
              delay = optional(object({
                fixed = object({
                  seconds = number
                  nanos   = number
                })
                percentage = number
              }))
            }))
            retry_policy = optional(object({
              num_retries      = number
              retry_conditions = optional(list(string))
              per_try_timeout = optional(object({
                seconds = number
                nanos   = optional(number)
              }))
            }))
            timeout = optional(object({
              seconds = number
              nanos   = optional(number)
            }))
            url_rewrite = optional(object({
              host          = optional(string)
              path_prefix   = optional(string)
              path_template = optional(string)
            }))
            weighted_backend_services = optional(map(object({
              weight = number
              header_action = optional(object({
                request_add = optional(map(object({
                  value   = string
                  replace = optional(bool, true)
                })))
                request_remove = optional(list(string))
                response_add = optional(map(object({
                  value   = string
                  replace = optional(bool, true)
                })))
                response_remove = optional(list(string))
              }))
            })))
          }))
          url_redirect = optional(object({
            host          = optional(string)
            https         = optional(bool)
            path          = optional(string)
            prefix        = optional(string)
            response_code = optional(string)
            strip_query   = optional(bool)
          }))
        })))
      })))
      test = optional(list(object({
        host        = string
        path        = string
        service     = string
        description = optional(string)
      })))
    }), { default_service = "default" })
  }))
}