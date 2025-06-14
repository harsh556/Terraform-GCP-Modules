variable "cloud_nat" {
  type = map(object({
    nat_name       = string
    project_id     = string
    region         = string
    router_network = string
    router_name    = string
  }))
  default = null
}

