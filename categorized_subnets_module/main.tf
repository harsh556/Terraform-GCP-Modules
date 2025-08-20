module "subnets_categorized" {
  source              = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc?ref=v39.0.0"
  for_each            = var.vpc_subnets
  project_id          = each.value.project_id
  name                = each.value.network_name
  vpc_create          = false
  subnets             = each.value.subnets
  subnets_psc         = each.value.subnets_psc
  subnets_proxy_only  = each.value.subnets_proxy_only
  subnets_private_nat = each.value.subnets_private_nat
}
