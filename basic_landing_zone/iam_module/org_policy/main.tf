module "org" {
  source          = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/organization?ref=v39.0.0"
  for_each        = var.org_policies
  organization_id = each.value.organization_id
  org_policy_custom_constraints = {
    for constraint_name, constraint_value in each.value.custom_constraints : constraint_name => {
      resource_types = constraint_value.custom_constraints_resource_types
      method_types   = constraint_value.custom_constraints_method_types
      condition      = constraint_value.custom_constraints_condition
      action_type    = constraint_value.custom_constraints_action_type
      display_name   = constraint_value.custom_constraints_display_name
      description    = constraint_value.custom_constraints_description
    }
  }
  # not necessarily to enforce on the org level, policy may be applied on folder/project levels
  org_policies = {
    for org_policy_name, org_policy_value in each.value.org_policy : org_policy_name => {
      rules = org_policy_value.rules
    }
  }
}
