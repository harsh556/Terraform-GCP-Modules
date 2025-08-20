variable "armor_config" {
  type = map(object({
    project_id  = string
    name        = string
    description = string
    pre_configured_rules = optional(map(object({
      action                  = string
      priority                = number
      description             = optional(string)
      preview                 = optional(bool, false)
      redirect_type           = optional(string, null)
      redirect_target         = optional(string, null)
      target_rule_set         = string
      sensitivity_level       = optional(number, 4)
      include_target_rule_ids = optional(list(string), [])
      exclude_target_rule_ids = optional(list(string), [])
      rate_limit_options = optional(object({
        enforce_on_key      = optional(string)
        enforce_on_key_name = optional(string)
        enforce_on_key_configs = optional(list(object({
          enforce_on_key_name = optional(string)
          enforce_on_key_type = optional(string)
        })))
        exceed_action                        = optional(string)
        rate_limit_http_request_count        = optional(number)
        rate_limit_http_request_interval_sec = optional(number)
        ban_duration_sec                     = optional(number)
        ban_http_request_count               = optional(number)
        ban_http_request_interval_sec        = optional(number)
      }))

      header_action = optional(list(object({
        header_name  = optional(string)
        header_value = optional(string)
      })))

      preconfigured_waf_config_exclusions = optional(map(object({
        target_rule_set = string
        target_rule_ids = optional(list(string), [])
        request_header = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_cookie = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_uri = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_query_param = optional(list(object({
          operator = string
          value    = optional(string)
        })))
      })))
    })), {})
    security_rules = optional(map(object({
      action          = string
      priority        = number
      description     = optional(string)
      preview         = optional(bool, false)
      redirect_type   = optional(string, null)
      redirect_target = optional(string, null)
      src_ip_ranges   = list(string)
      rate_limit_options = optional(object({
        enforce_on_key      = optional(string)
        enforce_on_key_name = optional(string)
        enforce_on_key_configs = optional(list(object({
          enforce_on_key_name = optional(string)
          enforce_on_key_type = optional(string)
        })))
        exceed_action                        = optional(string)
        rate_limit_http_request_count        = optional(number)
        rate_limit_http_request_interval_sec = optional(number)
        ban_duration_sec                     = optional(number)
        ban_http_request_count               = optional(number)
        ban_http_request_interval_sec        = optional(number)
      }))
      header_action = optional(list(object({
        header_name  = optional(string)
        header_value = optional(string)
      })))
    })), {})
    custom_rules = optional(map(object({
      action          = string
      priority        = number
      description     = optional(string)
      preview         = optional(bool, false)
      expression      = string
      redirect_type   = optional(string, null)
      redirect_target = optional(string, null)
      rate_limit_options = optional(object({
        enforce_on_key      = optional(string)
        enforce_on_key_name = optional(string)
        enforce_on_key_configs = optional(list(object({
          enforce_on_key_name = optional(string)
          enforce_on_key_type = optional(string)
        })))
        exceed_action                        = optional(string)
        rate_limit_http_request_count        = optional(number)
        rate_limit_http_request_interval_sec = optional(number)
        ban_duration_sec                     = optional(number)
        ban_http_request_count               = optional(number)
        ban_http_request_interval_sec        = optional(number)
      }))
      header_action = optional(list(object({
        header_name  = optional(string)
        header_value = optional(string)
      })))

      preconfigured_waf_config_exclusions = optional(map(object({
        target_rule_set = string
        target_rule_ids = optional(list(string), [])
        request_header = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_cookie = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_uri = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_query_param = optional(list(object({
          operator = string
          value    = optional(string)
        })))
      })))
    })), {})
    threat_intelligence_rules = optional(map(object({
      action      = string
      priority    = number
      description = optional(string)
      preview     = optional(bool, false)
      feed        = string
      exclude_ip  = optional(string)
      rate_limit_options = optional(object({
        enforce_on_key      = optional(string)
        enforce_on_key_name = optional(string)
        enforce_on_key_configs = optional(list(object({
          enforce_on_key_name = optional(string)
          enforce_on_key_type = optional(string)
        })))
        exceed_action                        = optional(string)
        rate_limit_http_request_count        = optional(number)
        rate_limit_http_request_interval_sec = optional(number)
        ban_duration_sec                     = optional(number)
        ban_http_request_count               = optional(number)
        ban_http_request_interval_sec        = optional(number)
      }))
      header_action = optional(list(object({
        header_name  = optional(string)
        header_value = optional(string)
      })))
    })), {})
    adaptive_protection_auto_deploy = optional(object({
      enable                      = bool
      priority                    = optional(number, null)
      action                      = optional(string, null)
      preview                     = optional(bool, false)
      description                 = optional(string)
      load_threshold              = optional(number)
      confidence_threshold        = optional(number)
      impacted_baseline_threshold = optional(number)
      expiration_sec              = optional(number)
      redirect_type               = optional(string)
      redirect_target             = optional(string)

      rate_limit_options = optional(object({
        enforce_on_key      = optional(string)
        enforce_on_key_name = optional(string)

        enforce_on_key_configs = optional(list(object({
          enforce_on_key_name = optional(string)
          enforce_on_key_type = optional(string)
        })))

        exceed_action                        = optional(string)
        rate_limit_http_request_count        = optional(number)
        rate_limit_http_request_interval_sec = optional(number)
        ban_duration_sec                     = optional(number)
        ban_http_request_count               = optional(number)
        ban_http_request_interval_sec        = optional(number)
      }))
    }))
    }
  ))
}
