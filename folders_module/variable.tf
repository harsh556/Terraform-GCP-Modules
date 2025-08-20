variable "folders" {
  description = "Map of folders to be created, with their display names and parent folders/organizations."
  type = map(object({
    folder_name = string
    parent_id   = string
  }))
  default = null
}

