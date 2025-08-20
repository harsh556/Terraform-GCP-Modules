variable "cloud_run_config" {
  description = "Configuration for Cloud Run services in a map format."
  type = map(object({
    project_id             = string
    region                 = string
    name                   = string
    prefix                 = optional(string)
    create_job             = optional(bool, false)
    custom_audiences       = optional(list(string))
    deletion_protection    = optional(bool)
    encryption_key         = optional(string)
    ingress                = optional(string)
    labels                 = optional(map(string))
    launch_stage           = optional(string)
    service_account        = optional(string)
    service_account_create = optional(bool, false)
    tag_bindings           = optional(map(string))
    vpc_connector_create = optional(object({
      ip_cidr_range = optional(string)
      machine_type  = optional(string)
      name          = optional(string)
      network       = optional(string)
      instances = optional(object({
        max = optional(number, 10)
        min = optional(number, 2)
      }), {})
      throughput = optional(object({
        max = optional(number)
        min = optional(number)
      }), {})
      subnet = optional(object({
        name       = optional(string)
        project_id = optional(string)
      }), {})
    }))

    # Containers Configuration
    containers = map(object({
      image   = string
      command = optional(list(string))
      args    = optional(list(string))
      env     = optional(map(string))
      env_from_key = optional(map(object({
        secret  = string
        version = string
      })))
      liveness_probe = optional(object({
        grpc = optional(object({
          port    = optional(number)
          service = optional(string)
        }))
        http_get = optional(object({
          http_headers = optional(map(string))
          path         = optional(string)
        }))
        failure_threshold     = optional(number)
        initial_delay_seconds = optional(number)
        period_seconds        = optional(number)
        timeout_seconds       = optional(number)
      }))
      ports = optional(map(object({
        container_port = optional(number)
        name           = optional(string)
      })))
      resources = optional(object({
        limits = optional(object({
          cpu    = string
          memory = string
        }))
        cpu_idle          = optional(bool)
        startup_cpu_boost = optional(bool)
      }))
      startup_probe = optional(object({
        grpc = optional(object({
          port    = optional(number)
          service = optional(string)
        }))
        http_get = optional(object({
          http_headers = optional(map(string))
          path         = optional(string)
        }))
        tcp_socket = optional(object({
          port = optional(number)
        }))
        failure_threshold     = optional(number)
        initial_delay_seconds = optional(number)
        period_seconds        = optional(number)
        timeout_seconds       = optional(number)
      }))
      volume_mounts = optional(map(string))
    }))

    # Eventarc Triggers
    eventarc_triggers = optional(object({
      audit_log = optional(map(object({
        method  = string
        service = string
      })))
      pubsub                 = optional(map(string))
      service_account_email  = optional(string)
      service_account_create = optional(bool, false)
    }), {})

    # IAM Bindings
    iam = optional(map(list(string)), {})

    # Revision Configuration
    revision = optional(object({
      name                       = optional(string)
      gen2_execution_environment = optional(bool)
      max_concurrency            = optional(number)
      max_instance_count         = optional(number)
      min_instance_count         = optional(number)
      job = optional(object({
        max_retries = optional(number)
        task_count  = optional(number)
      }), {})
      vpc_access = optional(object({
        connector = optional(string)
        egress    = optional(string)
        network   = optional(string)
        subnet    = optional(string)
        tags      = optional(list(string))
      }), {})
      timeout = optional(string)
    }), {})

    # Volumes Configuration
    volumes = optional(map(object({
      secret = optional(object({
        name         = string
        default_mode = optional(string)
        path         = optional(string)
        version      = optional(string)
        mode         = optional(string)
      }))
      cloud_sql_instances = optional(list(string))
      empty_dir_size      = optional(string)
      gcs = optional(object({
        bucket       = string
        is_read_only = optional(bool)
      }))
      nfs = optional(object({
        server       = string
        path         = optional(string)
        is_read_only = optional(bool)
      }))
    })), {})
  }))

}
