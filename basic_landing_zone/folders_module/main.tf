
module "folders" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/folder?ref=v39.0.0"

  for_each = var.folders

  name                    = each.value.folder_name
  parent                  = each.value.parent_id
  folder_create           = true
  assured_workload_config = null
  deletion_protection     = false
  contacts                = {}
  firewall_policy         = null
  id                      = null
}
