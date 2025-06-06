variable "policy_by_principal" {
  type = map(object({
    project_id = string
    principal  = string
    roles      = list(string)
  }))
  default = null
}

