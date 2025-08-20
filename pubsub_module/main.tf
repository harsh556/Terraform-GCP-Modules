module "topic_with_schema" {
  source                     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/pubsub?ref=v39.0.0"
  for_each                   = var.pubsub
  project_id                 = each.value.project_id
  name                       = each.value.topic_name
  kms_key                    = each.value.kms_key_name
  labels                     = each.value.labels
  iam                        = each.value.iam
  iam_bindings_additive      = each.value.iam_bindings_additive
  message_retention_duration = each.value.message_retention_duration
  schema                     = each.value.schema
  regions                    = each.value.regions
  subscriptions              = each.value.subscriptions
}
# tftest modules=1 resources=2 inventory=schema.yaml e2e