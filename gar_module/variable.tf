variable "gar_config" {
  type = map(object({
    project_id     = string
    name           = string
    location       = string
    labels         = optional(map(string))
    description    = optional(string)
    encryption_key = optional(string)
    format = object({
      apt = optional(object({
        remote = optional(object({
          public_repository           = string
          disable_upstream_validation = optional(bool)
          upstream_credentials = optional(object({
            username                = string
            password_secret_version = string
          }))
        }))
        standard = optional(bool)
      }))
      docker = optional(object({
        remote = optional(object({
          public_repository           = optional(string)
          custom_repository           = optional(string)
          disable_upstream_validation = optional(bool)
          upstream_credentials = optional(object({
            username                = string
            password_secret_version = string
          }))
        }))
        standard = optional(object({
          immutable_tags = optional(bool)
        }))
        virtual = optional(map(object({
          repository = string
          priority   = number
        })))
      }))
      kfp = optional(object({
        standard = optional(bool)
      }))
      generic = optional(object({
        standard = optional(bool)
      }))
      go = optional(object({
        standard = optional(bool)
      }))
      googet = optional(object({
        standard = optional(bool)
      }))
      maven = optional(object({
        remote = optional(object({
          public_repository = optional(string)
          custom_repository = optional(string)

          disable_upstream_validation = optional(bool)
          upstream_credentials = optional(object({
            username                = string
            password_secret_version = string
          }))
        }))
        standard = optional(object({
          allow_snapshot_overwrites = optional(bool)
          version_policy            = optional(string)
        }))
        virtual = optional(map(object({
          repository = string
          priority   = number
        })))
      }))
      npm = optional(object({
        remote = optional(object({
          public_repository = optional(string)
          custom_repository = optional(string)

          disable_upstream_validation = optional(bool)
          upstream_credentials = optional(object({
            username                = string
            password_secret_version = string
          }))
        }))
        standard = optional(bool)
        virtual = optional(map(object({
          repository = string
          priority   = number
        })))
      }))
      python = optional(object({
        remote = optional(object({
          public_repository = optional(string)
          custom_repository = optional(string)

          disable_upstream_validation = optional(bool)
          upstream_credentials = optional(object({
            username                = string
            password_secret_version = string
          }))
        }))
        standard = optional(bool)
        virtual = optional(map(object({
          repository = string
          priority   = number
        })))
      }))
      yum = optional(object({
        remote = optional(object({
          public_repository = string 

          disable_upstream_validation = optional(bool)
          upstream_credentials = optional(object({
            username                = string
            password_secret_version = string
          }))
        }))
        standard = optional(bool)
      }))
    })
    cleanup_policy_dry_run = optional(bool)
    cleanup_policies = optional(map(object({
      action = string
      condition = optional(object({
        tag_state             = optional(string)
        tag_prefixes          = optional(list(string))
        older_than            = optional(string)
        newer_than            = optional(string)
        package_name_prefixes = optional(list(string))
        version_name_prefixes = optional(list(string))
      }))
      most_recent_versions = optional(object({
        package_name_prefixes = optional(list(string))
        keep_count            = optional(number)
      }))
    })))
  }))

}