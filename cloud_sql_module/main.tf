# Calling module for Cloud SQL
module "cloudsql_instance" {
  source   = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloudsql-instance?ref=v39.0.0"
  for_each = var.cloudsql_config


  project_id        = each.value.project_id
  region            = each.value.region
  name              = each.value.name
  database_version  = each.value.database_version
  tier              = each.value.tier
  availability_type = each.value.availability_type


  prefix                        = each.value.prefix
  activation_policy             = each.value.activation_policy
  backup_configuration          = each.value.backup_configuration
  collation                     = each.value.collation
  connector_enforcement         = each.value.connector_enforcement
  data_cache                    = each.value.data_cache
  databases                     = each.value.databases
  disk_autoresize_limit         = each.value.disk_autoresize_limit
  disk_size                     = each.value.disk_size
  disk_type                     = each.value.disk_type
  edition                       = each.value.edition
  encryption_key_name           = each.value.encryption_key_name
  flags                         = each.value.flags
  gcp_deletion_protection       = each.value.gcp_deletion_protection
  insights_config               = each.value.insights_config
  labels                        = each.value.labels
  maintenance_config            = each.value.maintenance_config
  network_config                = each.value.network_config
  password_validation_policy    = each.value.password_validation_policy
  replicas                      = each.value.replicas
  root_password                 = each.value.root_password
  ssl                           = each.value.ssl
  terraform_deletion_protection = each.value.terraform_deletion_protection
  time_zone                     = each.value.time_zone
  users                         = each.value.users
}
