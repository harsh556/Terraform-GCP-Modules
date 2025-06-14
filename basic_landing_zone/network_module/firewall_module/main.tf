module "firewall" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc-firewall"
  for_each   = var.firewall_rules

  project_id = each.value.project_id
  network    = each.value.network_name
  default_rules_config = {
    disabled = each.value.disable_default_rules_config
  }

  # Egress Rules
  egress_rules = each.value.egress_rules

  # Ingress Rules (Separate loop)
  ingress_rules = each.value.ingress_rules
}
