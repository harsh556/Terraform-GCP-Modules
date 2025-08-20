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
| [subnets\_categorized](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [vpc\_subnets](#input_vpc_subnets) | Configuration for creating categorized subnets (standard, PSC, proxy-only, Private NAT) within a VPC network. | <pre>map(object({<br/>    project_id   = string<br/>    network_name = string<br/>    subnets = optional(list(object({<br/>      name                = string<br/>      ip_cidr_range       = string<br/>      region              = string<br/>      description         = optional(string)<br/>      secondary_ip_ranges = optional(map(string))<br/>    })))<br/>    subnets_psc = optional(list(object({<br/>      name          = string<br/>      ip_cidr_range = string<br/>      region        = string<br/>      description   = optional(string)<br/>    })))<br/>    subnets_proxy_only = optional(list(object({<br/>      ip_cidr_range = string<br/>      name          = string<br/>      description   = optional(string)<br/>      region        = string<br/>      active        = optional(bool)<br/>      global        = optional(bool)<br/>    })))<br/>    subnets_private_nat = optional(list(object({<br/>      name          = string<br/>      ip_cidr_range = string<br/>      region        = string<br/>      description   = optional(string)<br/>    })))<br/>  }))</pre> | `null` | no |

<a name="input_vpc_subnets"></a>

### `vpc_subnets` Details:

This input variable is a map where each key represents an identifier for a VPC network to which you want to add categorized subnets. The value associated with each key is an object defining the project, network and various subnet configurations.

#### VPC Subnet Configuration Object:

| Attribute           | Type                 | Description                                                                                                                                                                                   | Required | Default |
| ------------------- | -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `project_id`        | string               | The ID of the Google Cloud project where the VPC network exists.                                                                                                                             | Yes      |         |
| `network_name`      | string               | The name of the VPC network to which the subnets will be added.                                                                                                                              | Yes      |         |
| `subnets`           | optional(list(Subnet Object))       | A list of standard subnets to create in the VPC network.  If not specified, no standard subnets are created.                                                                      | No       |         |
| `subnets_psc`       | optional(list(PSC Subnet Object))   | A list of subnets to create for Private Service Connect endpoints.  If not specified, no PSC subnets are created.                                                                 | No       |         |
| `subnets_proxy_only`| optional(list(Proxy-Only Subnet Object))| A list of proxy-only subnets. If not specified, no proxy-only subnets are created.   | No       |         |
| `subnets_private_nat`| optional(list(Private NAT Subnet Object))   | A list of subnets to use for Cloud NAT.   If not specified, no NAT subnets are created.                                                              | No       |         |

#### Subnet Object:

| Attribute         | Type               | Description                                                                                                                                | Required | Default |
| ----------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `name`            | string             | The name of the subnet. Must be unique within the region.                                                                                 | Yes      |         |
| `ip_cidr_range`   | string             | The IP CIDR range for the subnet (e.g., `"10.0.0.0/24"`).                                                                                  | Yes      |         |
| `region`          | string             | The region where the subnet will be created (e.g., `"us-central1"`).                                                                          | Yes      |         |
| `description`     | optional(string)   | A description of the subnet.                                                                                                             | No       |         |
| `secondary_ip_ranges`|optional(map(string))|A map of secondary IP ranges for the subnet.  Keys are secondary range names, values are CIDR blocks.      | No       |         |

#### PSC Subnet Object:

| Attribute       | Type     | Description                                                                                                                                                              | Required | Default |
| --------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `name`          | string   | The name of the subnet. Must be unique within the region.                                                                                                              | Yes      |         |
| `ip_cidr_range` | string   | The IP CIDR range for the subnet (e.g., `"10.1.0.0/24"`).                                                                                                               | Yes      |         |
| `region`        | string   | The region where the subnet will be created (e.g., `"us-east1"`).                                                                                                        | Yes      |         |
| `description`   | optional(string) | A description of the subnet.                                                                                                                                           | No       |         |

#### Proxy-Only Subnet Object:

| Attribute       | Type     | Description                                                                                                                                                     | Required | Default |
| --------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `ip_cidr_range` | string   | The IP CIDR range for the proxy-only subnet (e.g., `"10.2.0.0/23"`).                                                                                          | Yes      |         |
| `name`          | string   | The name of the subnet. Must be unique within the region.                                                                                                              | Yes      |         |
| `description`   | optional(string) | A description of the subnet.                                                                                                                                         | No       |         |
| `region`        | string   | The region where the subnet will be created (e.g., `"us-west2"`).                                                                                                       | Yes      |         |
| `active`        | optional(bool) | This field is to determine whether the specified internal load balancer is uses global access  | No       |         |
| `global`        | optional(bool) | If the proxy-only subnet is global access enabled, set this to be true. It uses the same address family IP Protocol(IPV4 or IPV6) | No       |         |

#### Private NAT Subnet Object:

| Attribute       | Type     | Description                                                                                                                                                            | Required | Default |
| --------------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `name`          | string   | The name of the subnet. Must be unique within the region.                                                                                                             | Yes      |         |
| `ip_cidr_range` | string   | The IP CIDR range for the subnet (e.g., `"10.3.0.0/24"`).                                                                                                              | Yes      |         |
| `region`        | string   | The region where the subnet will be created (e.g., `"europe-west4"`).                                                                                                  | Yes      |         |
| `description`   | optional(string) | A description of the subnet.                                                                                                                                        | No       |         |

