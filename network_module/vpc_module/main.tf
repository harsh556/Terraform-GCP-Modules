module "vpc" {
  source   = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc?ref=39.0.0"
  for_each = var.vpc_config

  project_id   = each.value.project_id
  name         = each.value.network_name
  description  = each.value.description
  routing_mode = each.value.routing_mode
  psa_configs  = each.value.psa_configs

  subnets = [
    for subnet_name, subnet in each.value.subnets : {
      name          = subnet.subnet_name
      ip_cidr_range = subnet.cidr
      region        = subnet.region
      description   = subnet.subnet_description
      secondary_ip_ranges = {
        # Directly define keys and values from subnet.secondary_ranges
        for sr_key, sr_value in subnet.secondary_ranges : sr_value.secondary_range_name => sr_value.secondary_range_cidr
      }
    }
  ]
}
