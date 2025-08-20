variable "shared_vpc" {
  type = map(object({
    host_project_id      = string
    service_project_id   = string
    network_users        = optional(list(string))
    network_subnet_users = optional(map(list(string)))
  }))
  default = null
}

