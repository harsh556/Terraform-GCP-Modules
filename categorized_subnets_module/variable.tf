variable "vpc_subnets" {
  type = map(object({
    project_id   = string
    network_name = string
    subnets = optional(list(object({
      name                = string
      ip_cidr_range       = string
      region              = string
      description         = optional(string)
      secondary_ip_ranges = optional(map(string))
    })))
    subnets_psc = optional(list(object({
      name          = string
      ip_cidr_range = string
      region        = string
      description   = optional(string)
    })))
    subnets_proxy_only = optional(list(object({
      ip_cidr_range = string
      name          = string
      description   = optional(string)
      region        = string
      active        = optional(bool)
      global        = optional(bool)
    })))
    subnets_private_nat = optional(list(object({
      name          = string
      ip_cidr_range = string
      region        = string
      description   = optional(string)
    })))
  }))
  default = null
}
