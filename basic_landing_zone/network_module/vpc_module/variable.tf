variable "vpc_config" {
  type = map(object({
    network_name = string
    project_id   = string
    description  = string
    routing_mode = string
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

