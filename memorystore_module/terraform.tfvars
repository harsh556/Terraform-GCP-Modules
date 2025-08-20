enable_memorystore_creation = true

memorystore = {
  app-red01 = {
    project_id    = ""
    instance_name = ""
    shard_count   = 1
    region        = ""
    # replica_count      = null

    # List of consumer network where the network address of the discovery endpoint will be reserved. Currently, only one item is supported.
    network = [""]

    # transit_encryption_mode = "SERVER_AUTHENTICATION"
    # authorization_mode = ""
    node_type = ""
    # redis_config = {

    # }
    service_connection_policies = {
      service_connection_policies1 = {
        network_name    = ""
        network_project = ""
        subnet_names    = [""]
        labels = {
          env        = "dev"
          created-by = "terraform"
          owner      = ""
        }
        limits = {}
      }
    }

    # zone_distribution_config_mode = "MULTI_ZONE"
    # zone_distribution_config_zone = null
    # deletion_protection_enabled = true

  }
}
