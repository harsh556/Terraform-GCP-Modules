variable "firewall_rules" {
  type = map(object({
    project_id                   = string
    network_name                 = string
    disable_default_rules_config = bool
    ingress_rules = optional(map(object({
      deny                 = bool
      description          = string
      source_ranges        = list(string)
      destination_ranges   = list(string)
      sources              = list(string)
      targets              = list(string)
      use_service_accounts = bool
      priority             = number
      rules = optional(list(object({
        protocol = string
        ports    = list(string)
      })))
      })),
    ),
    egress_rules = optional(map(object({
      deny                 = bool
      description          = string
      source_ranges        = list(string)
      destination_ranges   = list(string)
      sources              = list(string)
      targets              = list(string)
      use_service_accounts = bool
      priority             = number
      rules = optional(list(object({
        protocol = string
        ports    = list(string)
      })))
      })),
    ),
  }))
  default = null
}
