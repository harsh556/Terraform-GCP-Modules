variable "projects" {
  type = map(object({
    project_name        = string
    parent_id           = string
    billing_account_id  = string
    prefix              = optional(string)
    labels              = map(string)
    auto_create_network = string
    deletion_policy     = string
    enable_apis         = list(string)
  }))
  default = null
}

