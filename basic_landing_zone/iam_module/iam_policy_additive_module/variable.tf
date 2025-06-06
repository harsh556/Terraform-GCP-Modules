variable "additive_policy" {
  type = map(object({
    project_id = string
    iam_bindings_additive = map(object({
      member = string
      role   = string
    }))
  }))
  default = null
}
