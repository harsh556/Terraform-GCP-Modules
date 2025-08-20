module "security_policy" {
  source                               = "github.com/GoogleCloudPlatform/terraform-google-cloud-armor?ref=v5.0.0"
  for_each                             = var.armor_config
  project_id                           = each.value.project_id
  name                                 = each.value.name
  description                          = each.value.description
  default_rule_action                  = "deny(403)"
  type                                 = "CLOUD_ARMOR"
  layer_7_ddos_defense_enable          = true
  layer_7_ddos_defense_rule_visibility = "STANDARD"
  pre_configured_rules                 = each.value.pre_configured_rules
  security_rules                       = each.value.security_rules
  custom_rules                         = each.value.custom_rules
  threat_intelligence_rules            = each.value.threat_intelligence_rules
  # adaptive_protection_auto_deploy      = each.value.adaptive_protection_auto_deploy  # for enterprise
}
