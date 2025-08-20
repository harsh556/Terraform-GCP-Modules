module "host-project" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project?ref=v39.0.0"
  for_each       = var.shared_vpc
  project_reuse = {
    use_data_source = true
  }
  name           = each.value.host_project_id
  shared_vpc_host_config = {
    enabled = true
  }
}

module "service-project" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project?ref=v39.0.0"
  depends_on     = [module.host-project]
  for_each       = var.shared_vpc
  project_reuse = {
    use_data_source = true
  }
  name           = each.value.service_project_id
  shared_vpc_service_config = {
    host_project         = each.value.host_project_id
    network_users        = each.value.network_users
    network_subnet_users = each.value.network_subnet_users
  }
}
