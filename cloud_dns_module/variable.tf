variable "dns_config" {
  type = map(object({
    name       = string
    project_id = string
    zone_config = object({
      domain = string
      private = optional(object({
        client_networks = list(string)
      }))
      forwarding = optional(object({
        client_networks = list(string)
        forwarders      = map(string)
      }))
      peering = optional(object({
        client_networks = list(string)
        peer_network    = string
      }))
      public = optional(object({
        dnssec_config = object({
          state = string
        })
        enable_logging = bool
      }))
    })
    recordsets = optional(map(object({
      ttl     = optional(number)
      records = list(string)
    })))
  }))
}
