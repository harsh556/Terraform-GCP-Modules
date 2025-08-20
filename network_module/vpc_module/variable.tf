variable "vpc_config" {
  type = map(object({
    network_name = string
    project_id   = string
    description  = string
    routing_mode = string
    psa_configs  = optional(list(object({
      deletion_policy  = optional(string, null)
      ranges           = map(string)              # Ex :  { myrange = "10.0.1.0/24" }
      export_routes    = optional(bool, false)
      import_routes    = optional(bool, false)
      peered_domains   = optional(list(string), [])
      range_prefix     = optional(string)         # Ex : "/24"
      service_producer = optional(string, "servicenetworking.googleapis.com")
    })),[])
    subnets = map(object({
      subnet_name        = string
      subnet_description = string
      region             = string
      cidr               = string
      secondary_ranges = map(object({
        secondary_range_name = string
        secondary_range_cidr = string
      }))
    }))
  }))
  default = null
}

