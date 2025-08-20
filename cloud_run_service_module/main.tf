module "cloud_run_service" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloud-run-v2?ref=39.0.0"

  for_each = var.cloud_run_config

  project_id = each.value.project_id
  region     = each.value.region
  name       = each.value.name

  prefix                 = each.value.prefix
  create_job             = each.value.create_job
  custom_audiences       = each.value.custom_audiences
  deletion_protection    = each.value.deletion_protection
  encryption_key         = each.value.encryption_key
  ingress                = each.value.ingress
  labels                 = each.value.labels
  launch_stage           = each.value.launch_stage
  service_account        = each.value.service_account
  service_account_create = each.value.service_account_create
  tag_bindings           = each.value.tag_bindings
  vpc_connector_create   = each.value.vpc_connector_create
  containers             = each.value.containers
  eventarc_triggers      = each.value.eventarc_triggers
  iam                    = each.value.iam
  revision               = each.value.revision
  volumes                = each.value.volumes
}
