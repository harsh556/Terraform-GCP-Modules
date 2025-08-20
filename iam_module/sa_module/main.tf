module "service-accounts" {
  source       = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/iam-service-account?ref=v39.0.0"
  for_each     = var.service_accounts
  project_id   = each.value.project_id
  name         = each.value.sa_name
  display_name = each.value.display_name
  prefix       = each.value.prefix
  description  = each.value.description
  # authoritative roles granted *on* the service accounts to other identities
  iam = {
    "roles/iam.serviceAccountUser" = each.value.sa_users
  }
  # non-authoritative roles granted *to* the service accounts on other resources
  iam_project_roles = {
    "${each.value.project_id}" = each.value.iam_project_roles
  }
}
