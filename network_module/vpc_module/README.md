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
| [vpc](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [vpc\_config](variable.tf#L1) | Configuration for the VPC network(s).  This map allows you to define multiple VPC networks and their subnets. | <pre>map(object({<br/>    network_name = string<br/>    project_id   = string<br/>    description  = string<br/>    routing_mode = string<br/>    subnets = map(object({<br/>      subnet_name        = string<br/>      subnet_description = string<br/>      region             = string<br/>      cidr               = string<br/>      secondary_ranges = map(object({<br/>        secondary_range_name = string<br/>        secondary_range_cidr = string<br/>      }))<br/>    }))<br/>  }))</pre> | `null` | yes |

<a name="input_vpc_config"></a>

### `vpc_config` Details:

This input variable is a map where each key represents the name or identifier for a VPC network you want to create. The value associated with each key is an object defining the VPC's configuration.

#### VPC Configuration Object:

| Attribute      | Type   | Description                                                                                                | Required | Default    |
|----------------|--------|------------------------------------------------------------------------------------------------------------|----------|------------|
| `network_name` | string | The name of the VPC network. This must be unique within the project.                                       | Yes      |            |
| `project_id`   | string | The ID of the Google Cloud project where the VPC will be created.                                          | Yes      |            |
| `description`  | string | A description of the VPC network.                                                                         | No       | `""`       |
| `routing_mode` | string | The routing mode for the VPC network. Valid values are `"GLOBAL"` or `"REGIONAL"`.                        | No       | `"REGIONAL"`|
| `subnets`      | map    | A map defining the subnets within the VPC network. Each key in this map represents the name/identifier for a subnet. | Yes      |            |

#### Subnet Configuration Object:

| Attribute             | Type   | Description                                                                                  | Required | Default |
|-----------------------|--------|----------------------------------------------------------------------------------------------|----------|---------|
| `subnet_name`         | string | The name of the subnet. Must be unique within the region.                                     | Yes      |         |
| `subnet_description`  | string | A description of the subnet.                                                                 | No       | `""`    |
| `region`              | string | The region where the subnet will be created (e.g., `"us-central1"`).                            | Yes      |         |
| `cidr`                | string | The CIDR block for the subnet (e.g., `"10.10.0.0/20"`).                                       | Yes      |         |
| `secondary_ranges`    | map    | A map defining secondary IP ranges for the subnet (e.g., for GKE Pods or Services).          | No       |         |

#### Secondary Range Configuration Object:

| Attribute              | Type   | Description                                                                                  | Required                                  | Default |
|------------------------|--------|----------------------------------------------------------------------------------------------|-------------------------------------------|---------|
| `secondary_range_name` | string | The name of the secondary range. Must be unique within the subnet.                              | Yes, if `secondary_ranges` is defined      |         |
| `secondary_range_cidr` | string | The CIDR block for the secondary range (e.g., `"192.168.0.0/24"`).                             | Yes, if `secondary_ranges` is defined      |         |
