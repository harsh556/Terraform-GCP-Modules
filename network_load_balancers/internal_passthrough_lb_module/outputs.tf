output "backend_service" {
  description = "Backend resource."
  sensitive   = true
  value = {
    for k, v in module.ilb : k => v.backend_service
  }
}

output "backend_service_id" {
  description = "Backend id."
  value = {
    for k, v in module.ilb : k => v.backend_service_id
  }
}

output "backend_service_self_link" {
  description = "Backend self link."
  value = {
    for k, v in module.ilb : k => v.backend_service_self_link
  }
}

output "forwarding_rule_addresses" {
  description = "Forwarding rule address."
  value = {
    for k, v in module.ilb : k => v.forwarding_rule_addresses
  }
}

output "forwarding_rule_self_links" {
  description = "Forwarding rule self links."
  value = {
    for k, v in module.ilb : k => v.forwarding_rule_self_links
  }
}

output "forwarding_rules" {
  description = "Forwarding rule resources."
  value = {
    for k, v in module.ilb : k => v.forwarding_rules
  }
}

output "group_self_links" {
  description = "Optional unmanaged instance group self links."
  value = {
    for k, v in module.ilb : k => v.group_self_links
  }
}

output "groups" {
  description = "Optional unmanaged instance group resources."
  value = {
    for k, v in module.ilb : k => v.groups
  }
}

output "health_check" {
  description = "Auto-created health-check resource."
  value = {
    for k, v in module.ilb : k => v.health_check
  }
}

output "health_check_id" {
  description = "Auto-created health-check id."
  value = {
    for k, v in module.ilb : k => v.health_check_id
  }
}

output "health_check_self_link" {
  description = "Auto-created health-check self link."
  value = {
    for k, v in module.ilb : k => v.health_check_self_link
  }
}

output "id" {
  description = "Fully qualified forwarding rule ids."
  value = {
    for k, v in module.ilb : k => v.id
  }
}

output "service_attachment_ids" {
  description = "Service attachment ids."
  value = {
    for k, v in module.ilb : k => v.service_attachment_ids
  }
}