variable "pubsub" {
  type = map(object({
    project_id   = string
    topic_name   = string
    kms_key_name = optional(string)
    labels       = optional(map(string), {})
    iam          = optional(map(list(string)))
    iam_bindings_additive = optional(map(object({
      member = string
      role   = string
      condition = optional(object({
        expression  = string
        title       = string
        description = optional(string)
      }))
    })))
    message_retention_duration = optional(string) # Defaults to 1 day
    schema = optional(object({
      definition   = string
      msg_encoding = optional(string)
      schema_type  = string
    }), null)
    regions = optional(list(string), [])
    subscriptions = optional(map(object({
      ack_deadline_seconds         = optional(number)
      enable_exactly_once_delivery = optional(bool, false)
      enable_message_ordering      = optional(bool, false)
      expiration_policy_ttl        = optional(string)
      filter                       = optional(string)
      iam                          = optional(map(list(string)), {})
      labels                       = optional(map(string))
      message_retention_duration   = optional(string)
      retain_acked_messages        = optional(bool, false)
      bigquery = optional(object({
        table                 = string
        drop_unknown_fields   = optional(bool, false)
        service_account_email = optional(string)
        use_table_schema      = optional(bool, false)
        use_topic_schema      = optional(bool, false)
        write_metadata        = optional(bool, false)
      }))
      cloud_storage = optional(object({
        bucket          = string
        filename_prefix = optional(string)
        filename_suffix = optional(string)
        max_duration    = optional(string)
        max_bytes       = optional(number)
        avro_config = optional(object({
          write_metadata = optional(bool, false)
        }))
      }))
      dead_letter_policy = optional(object({
        topic                 = string
        max_delivery_attempts = optional(number)
      }))
      iam_bindings_additive = optional(map(object({
        member = string
        role   = string
        condition = optional(object({
          expression  = string
          title       = string
          description = optional(string)
        }))
      })), {})
      push = optional(object({
        endpoint   = string
        attributes = optional(map(string))
        no_wrapper = optional(object({
          write_metadata = optional(bool, false)
        }))
        oidc_token = optional(object({
          audience              = optional(string)
          service_account_email = string
        }))
      }))
      retry_policy = optional(object({
        minimum_backoff = optional(number)
        maximum_backoff = optional(number)
      }))
    })), {})
  }))
  description = "Map of Pub/Sub topic configurations."
  default     = {}
}