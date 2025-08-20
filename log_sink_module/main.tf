module "log_sink" {
  source               = "github.com/terraform-google-modules/terraform-google-log-export?ref=v11.0.0"
  for_each             = var.sink
  parent_resource_type = each.value.parent_resource_type
  parent_resource_id   = each.value.parent_resource_id
  log_sink_name        = each.value.log_sink_name
  destination_uri      = each.value.destination_uri
  description          = each.value.description
  filter                 = each.value.filter
  include_children       = each.value.include_children
  intercept_children     = each.value.intercept_children
  unique_writer_identity = each.value.unique_writer_identity
}