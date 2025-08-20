# Calling module for External TCP Proxy Load Balancer
module "tcp_proxy_lb" {
  source   = "github.com/terraform-google-modules/terraform-google-lb/modules/regional_proxy_lb" # Replace with the actual path to your root module
  for_each = var.tcp_proxy_lb_config

  # Required Variables
  name           = each.value.name
  project        = each.value.project
  region         = each.value.region
  network        = each.value.network
  port_front_end = each.value.port_front_end
  backend        = each.value.backend
  health_check   = each.value.health_check

  # Optional Variables
  network_project          = each.value.network_project
  create_firewall_rules    = each.value.create_firewall_rules
  target_tags              = each.value.target_tags
  address                  = each.value.address
  create_proxy_only_subnet = each.value.create_proxy_only_subnet
  proxy_only_subnet_cidr   = each.value.proxy_only_subnet_cidr
  proxy_header             = each.value.proxy_header
}