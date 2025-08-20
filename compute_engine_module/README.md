## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.7.4 |
| [google](#requirement_google) | >= 6.1.0, < 7.0.0 |
| [google-beta](#requirement_google-beta) | >= 6.1.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [vm](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/compute-vm | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [vm\_config](variable.tf#L1) | Configuration for creating Compute Engine virtual machines. | <pre>map(object({<br/>    project_id      = string<br/>    name            = string<br/>    zone            = string<br/>    description     = optional(string)<br/>    instance_type   = string<br/>    network_tags    = optional(list(string))<br/>    labels          = optional(map(string))<br/>    vpc             = string<br/>    subnet          = string<br/>    sa_email        = optional(string)<br/>    boot_disk_image = optional(string)<br/>    boot_disk_size  = optional(number)<br/>    boot_disk_type  = optional(string)<br/>  }))</pre> | `null` | no |

<a name="input_vm_config"></a>

### `vm_config` Details:

This input variable is a map where each key represents an identifier for a Compute Engine VM instance you want to create. The value associated with each key is an object defining the VM's configuration.

#### VM Instance Configuration Object:

| Attribute         | Type          | Description                                                                                                                                                   | Required | Default |
|-------------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`      | string        | The ID of the Google Cloud project where the VM instance will be created.                                                                                 | Yes      |         |
| `name`            | string        | The name of the VM instance. This name must be unique within the zone.                                                                                  | Yes      |         |
| `zone`            | string        | The zone where the VM instance will be created (e.g., `"us-central1-a"`).                                                                               | Yes      |         |
| `description`     | optional(string)  | A description of the VM instance.                                                                                                                             | No       |         |
| `instance_type`   | string        | The machine type to use for the VM instance (e.g., `"n1-standard-1"`).                                                                                    | Yes      |         |
| `network_tags`    | optional(list(string)) | A list of network tags to apply to the VM instance.                                                                                                   | No       |         |
| `labels`          | optional(map(string)) | A map of labels to apply to the VM instance.                                                                                                              | No       |         |
| `vpc`             | string        | The name of the VPC network to which the VM instance will be connected.                                                                                 | Yes      |         |
| `subnet`          | string        | The name of the subnet to which the VM instance will be connected.                                                                                       | Yes      |         |
| `sa_email`        | optional(string)  | The email address of the service account to associate with the VM instance.                                                                                   | No       |         |
| `boot_disk_image` | optional(string)  | The image to use for the boot disk (e.g., `"debian-cloud/debian-11"`). If not specified, a default image is used.                                                                      | No       |         |
| `boot_disk_size`  | optional(number)  | The size of the boot disk, in GB.  If not specified, a default size is used.                                                                                             | No       |         |
| `boot_disk_type`  | optional(string)  | The type of the boot disk. Valid values are `"pd-standard"`, `"pd-ssd"`, and `"pd-balanced"`. If not specified, a default type is used.                             | No       |         |

