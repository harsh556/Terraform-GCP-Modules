module "vm" {
  source        = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/compute-vm?ref=v39.0.0"
  for_each      = var.vm_config
  project_id    = each.value.project_id
  name          = each.value.name
  zone          = each.value.zone
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
}

