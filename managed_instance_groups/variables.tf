variable "instance-templates" {
  type = map(object({
    project_id      = string
    template_name   = string
    region          = string
    description     = optional(string)
    instance_type   = string
    network_tags    = optional(list(string))
    labels          = optional(map(string))
    vpc             = string
    subnet          = string
    sa_email        = optional(string)
    boot_disk_image = optional(string)
    boot_disk_size  = optional(number)
    boot_disk_type  = optional(string)
  }))
  default = null
}

variable "mig" {
  type = map(object({
    project_id   = string
    location     = string
    mig_name     = string
    target_size  = string
    template_key = string
    max_replicas = number
    min_replicas = number
    scaling_signals = optional(object({
      cpu_utilization = optional(object({
        target                = number
        optimize_availability = optional(bool)
      }))
      load_balancing_utilization = optional(object({
        target = number
      }))
      metrics = optional(list(object({
        name                       = string
        type                       = optional(string) # GAUGE, DELTA_PER_SECOND, DELTA_PER_MINUTE
        target_value               = optional(number)
        single_instance_assignment = optional(number)
        time_series_filter         = optional(string)
      })))
      schedules = optional(list(object({
        duration_sec          = number
        name                  = string
        min_required_replicas = number
        cron_schedule         = string
        description           = optional(bool)
        timezone              = optional(string)
        disabled              = optional(bool)
      })))
    }), {})
  }))
}
