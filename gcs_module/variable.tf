variable "gcs_config" {
  type = map(object({
    project_id               = string
    prefix                   = optional(string)
    name                     = string
    location                 = string
    versioning               = bool
    public_access_prevention = string
    retention_policy = optional(object({
      retention_period = number
    }))
    lifecycle_rules = optional(map(object({
      action = object({
        type          = string
        storage_class = optional(string)
      })
      condition = object({
        age                        = optional(number)
        created_before             = optional(string)
        custom_time_before         = optional(string)
        days_since_custom_time     = optional(number)
        days_since_noncurrent_time = optional(number)
        matches_prefix             = optional(list(string))
        matches_storage_class      = optional(list(string)) # STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE, DURABLE_REDUCED_AVAILABILITY
        matches_suffix             = optional(list(string))
        noncurrent_time_before     = optional(string)
        num_newer_versions         = optional(number)
        with_state                 = optional(string) # "LIVE", "ARCHIVED", "ANY"
      })
    })))
    soft_delete_retention       = optional(number)
    uniform_bucket_level_access = bool
    labels                      = map(string)
  }))
}

