output "backend_services" {
  description = "The backend service resources."
  value = {
    for k, v in module.tcp_proxy_lb : k => v.backend_services
  }
}

output "forwarding_rule" {
  description = "The forwarding rule of the load balancer."
  value = {
    for k, v in module.tcp_proxy_lb : k => v.forwarding_rule
  }
}

output "tcp_proxy" {
  description = "The TCP proxy used by this module."
  value = {
    for k, v in module.tcp_proxy_lb : k => v.tcp_proxy
  }
}