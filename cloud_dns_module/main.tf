module "private-dns" {
  source      = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/dns?ref=v39.0.0"
  for_each    = var.dns_config
  project_id  = each.value.project_id
  name        = each.value.name
  zone_config = each.value.zone_config
  recordsets  = each.value.recordsets
}
# tftest modules=1 resources=4 inventory=private-zone.yaml e2e
