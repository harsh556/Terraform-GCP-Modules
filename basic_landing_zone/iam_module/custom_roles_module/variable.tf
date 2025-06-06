variable "custom_roles" {
  type = map(object({
    project_id       = string
    custom_role_name = string
    role_permissions = list(string)
    iam_principal    = list(string)
  }))
  default = null
}

