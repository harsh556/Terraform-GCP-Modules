variable "sink" {
  description = "A map of log sinks to create."
  type = map(object({
    parent_resource_type   = string
    parent_resource_id     = string
    log_sink_name          = string
    destination_uri        = string
    filter                 = optional(string)
    description            = optional(string, null)
    intercept_children     = optional(bool, false)
    include_children       = optional(bool, true)
    unique_writer_identity = optional(bool, true)
  }))
}