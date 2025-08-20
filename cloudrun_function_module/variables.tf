variable "cloud_function_config" {
  type = map(object({
    name                        = string
    prefix                      = optional(string)
    description                 = optional(string)
    bucket                      = optional(string)
    project_id                  = string
    region                      = optional(string)
    iam                         = optional(map(list(string)), {})
    ingress_settings            = optional(string, "ALLOW_INTERNAL_AND_GCLB")
    service_account_create      = optional(bool, false)
    service_account             = optional(string) # if you are giving manual SA
    docker_repository_id        = optional(string)
    build_service_account       = optional(string)
    build_worker_pool           = optional(string)
    build_environment_variables = optional(map(string))
    secrets = optional(map(object({
      is_volume  = bool
      project_id = string
      secret     = string
      versions   = list(string)
    })), null)
    bucket_config = optional(object({
      force_destroy             = optional(bool, true)
      lifecycle_delete_age_days = optional(number, 7)
      location                  = optional(string)
    }), null)
    function_config = optional(object({
      entry_point     = optional(string, "main")
      instance_count  = optional(number, 1)
      memory_mb       = optional(number, 256) # Memory in MB
      cpu             = optional(string, "0.166")
      runtime         = optional(string, "python310")
      timeout_seconds = optional(number, 180)
    }))
    bundle_config = object({
      path = string
      folder_options = optional(object({
        archive_path = optional(string)
        excludes     = optional(list(string))
      }), null)
    })
    trigger_config = optional(object({
      trigger_region        = optional(string)
      event_type            = string
      pubsub_topic          = optional(string)
      service_account_email = optional(string)
      retry_policy          = optional(string)

      event_filters = optional(list(object({
        attribute = string
        value     = string
      })))
    }), null)
    labels = map(string)

    vpc_connector = optional(object({
      name            = string
      egress_settings = optional(string, "ALL_TRAFFIC")
      create          = optional(bool, false)
    }), null)

    vpc_connector_config = optional(object({
      ip_cidr_range = string
      network       = string
      instances = optional(object({
        max = optional(number)
        min = optional(number)
      }))
      throughput = optional(object({
        max = optional(number, 300)
        min = optional(number, 200)
      }))
    }), null)
  }))
  description = "A map of Cloud Function configurations"
}
