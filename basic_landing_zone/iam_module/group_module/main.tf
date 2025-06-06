module "group" {
  source       = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloud-identity-group?ref=v39.0.0"
  for_each     = var.Groups
  name         = each.value.group_email
  display_name = each.value.group_name
  customer_id  = each.value.customer_id
  description  = each.value.description
  members      = each.value.members
  managers     = each.value.managers
}
