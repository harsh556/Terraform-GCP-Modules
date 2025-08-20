variable "cloudsql_config" {
  description = "Configuration for Cloud SQL instances in a map format."
  type = map(object({
    # Required Variables
    project_id        = string
    region            = string
    name              = string
    database_version  = string
    tier              = string
    availability_type = string

    # Optional Variables
    prefix                   = optional(string)
    activation_policy        = optional(string, "ALWAYS")
    backup_configuration = optional(object({
      enabled                        = optional(bool, false)
      binary_log_enabled             = optional(bool, false)
      start_time                     = optional(string, "23:00")
      location                       = optional(string)
      log_retention_days             = optional(number, 7)
      point_in_time_recovery_enabled = optional(bool)
      retention_count                = optional(number, 7)
    }), {})
    collation                = optional(string)
    connector_enforcement    = optional(string)
    data_cache               = optional(bool, false)
    databases                = optional(list(string))
    disk_autoresize_limit    = optional(number, 0)
    disk_size                = optional(number)
    disk_type                = optional(string, "PD_SSD")
    edition                  = optional(string, "ENTERPRISE")
    encryption_key_name      = optional(string)
    flags                    = optional(map(string))
    gcp_deletion_protection  = optional(bool, true)
    insights_config = optional(object({
      query_string_length     = optional(number, 1024)
      record_application_tags = optional(bool, false)
      record_client_address   = optional(bool, false)
      query_plans_per_minute  = optional(number, 5)
    }))
    labels = optional(map(string))
    maintenance_config = optional(object({
      maintenance_window = optional(object({
        day          = number
        hour         = number
        update_track = optional(string)
      }))
      deny_maintenance_period = optional(object({
        start_date = string
        end_date   = string
        start_time = optional(string, "00:00:00")
      }))
    }), {})
    network_config = optional(object({
      authorized_networks = optional(map(string))
      connectivity = object({
        public_ipv4 = optional(bool, false)
        psa_config = optional(object({
          private_network = string
          allocated_ip_ranges = optional(object({
            primary = optional(string)
            replica = optional(string)
          }))
        }))
        psc_allowed_consumer_projects    = optional(list(string))
        enable_private_path_for_services = optional(bool, false)
      })
    }))
    password_validation_policy = optional(object({
      enabled = optional(bool, true)
      change_interval             = optional(number)
      default_complexity          = optional(bool)
      disallow_username_substring = optional(bool)
      min_length                  = optional(number)
      reuse_interval              = optional(number)
    }))
    replicas = optional(map(object({
      region              = string
      encryption_key_name = optional(string)
    })), {})
    root_password = optional(object({
      password        = optional(string)
      random_password = optional(bool, false)
    }), {})
    ssl = optional(object({
      client_certificates = optional(list(string))
      mode = optional(string)
    }), {})
    terraform_deletion_protection = optional(bool, true)
    time_zone                = optional(string)
    users = optional(map(object({
      password = optional(string)
      type     = optional(string)
    })))
  }))
}