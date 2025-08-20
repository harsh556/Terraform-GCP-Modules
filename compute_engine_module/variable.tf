variable "vm_config" {
  type = map(object({
    project_id      = string
    name            = string
    zone            = string
    description     = optional(string)
    instance_type   = string
    network_tags    = optional(list(string))
    labels          = optional(map(string))
    vpc             = string
    subnet          = string
    sa_email        = optional(string)
    boot_disk_image = optional(string)
    boot_disk_size  = optional(number)
    boot_disk_type  = optional(string)
  }))
  default = null
}
