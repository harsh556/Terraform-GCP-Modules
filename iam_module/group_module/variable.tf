variable "Groups" {
  type = map(object({
    group_email = string
    group_name  = string
    customer_id = string
    description = string
    members     = list(string)
    managers    = list(string)
  }))
  default = null
}

