variable "global_lb" {
  type = map(object({
    name       = string
    project_id = string
    region     = string
    bucket = optional(string)
    backends = list(object({
      type = string
      name = string
      zone       = string
    }))
    cert_name    = list(string)
    network      = string
    sub_network  = string
    protocol     = string
    backend_type = optional(string)
    urlmap_config = object({
      default_service = optional(string)
      default_url_redirect = optional(object({
        host          = optional(string)
        https         = optional(bool)
        path          = optional(string)
        prefix        = optional(string)
        response_code = optional(string)
        strip_query   = optional(bool)
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
              host        = optional(string)
              path_prefix = optional(string)
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
              match_all = bool # MATCH_ANY, MATCH_ALL
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
    })
  }))
}
