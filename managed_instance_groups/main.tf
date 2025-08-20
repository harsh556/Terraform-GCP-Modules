module "instance-template" {
  source        = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/compute-vm?ref=v39.0.0"
  for_each      = var.instance-templates
  project_id    = each.value.project_id
  name          = each.value.template_name
  zone          = "${each.value.region}-a"
  description   = each.value.description
  labels        = each.value.labels
  instance_type = each.value.instance_type
  tags          = each.value.network_tags
  network_interfaces = [{
    network    = each.value.vpc
    subnetwork = each.value.subnet
  }]
  service_account = {
    email = each.value.sa_email
  }
  boot_disk = {
    initialize_params = {
      image = each.value.boot_disk_image
      size  = each.value.boot_disk_size
      type  = each.value.boot_disk_type
    }
  }
  metadata = {
    startup_script = null
  }
  create_template = true
}


module "mig" {
  source            = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/compute-mig?ref=v39.0.0"
  depends_on        = [module.instance-template]
  for_each          = var.mig
  project_id        = each.value.project_id
  location          = each.value.location # compute region or zone
  name              = each.value.mig_name
  target_size       = each.value.target_size
  instance_template = module.instance-template[each.value.template_key].template.id
  autoscaler_config = {
    max_replicas    = each.value.max_replicas
    min_replicas    = each.value.min_replicas
    cooldown_period = 30
    scaling_signals = each.value.scaling_signals
  }
}
