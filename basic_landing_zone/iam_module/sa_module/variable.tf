variable "service_accounts" {
  type = map(object({
    project_id        = string
    sa_name           = string
    display_name      = string
    prefix            = optional(string) # Optional, can be removed if not needed
    description       = string
    sa_users          = list(string)
    iam_project_roles = list(string)
  }))
  default = null
}
