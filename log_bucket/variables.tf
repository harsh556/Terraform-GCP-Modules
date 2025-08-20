variable "logging_bucket" {
  description = "Map of OpenSearch configurations"
  type = map(object({
    parent_type          = string # (project, folder, organization, billing_account)
    parent_id            = string # ('project_id' 'folders/folder_id', 'organizations/organization_id' or 'billing_account_id')
    bucket_name          = string
    enable_log_analytics = optional(bool, false)
    dataset_link_id      = optional(string, null)
  }))
}
