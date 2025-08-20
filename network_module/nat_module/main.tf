module "nat" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-cloudnat?ref=39.0.0"
  for_each       = var.cloud_nat
  name           = each.value.nat_name
  project_id     = each.value.project_id
  region         = each.value.region
  router_network = each.value.router_network
  router_name    = each.value.router_name
}
