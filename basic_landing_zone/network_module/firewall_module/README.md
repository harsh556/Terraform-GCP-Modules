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
| [firewall](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc-firewall | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [firewall\_rules](variable.tf#L1) | Configuration for creating and managing firewall rules in a VPC network. | <pre>map(object({<br/>    project_id                   = string<br/>    network_name                 = string<br/>    disable_default_rules_config = bool<br/>    ingress_rules = optional(map(object({<br/>      deny                 = bool<br/>      description          = string<br/>      source_ranges        = list(string)<br/>      destination_ranges   = list(string)<br/>      sources              = list(string)<br/>      targets              = list(string)<br/>      use_service_accounts = bool<br/>      priority             = number<br/>      rules = optional(list(object({<br/>        protocol = string<br/>        ports    = list(string)<br/>      })))<br/>      })),<br/>    ),<br/>    egress_rules = optional(map(object({<br/>      deny                 = bool<br/>      description          = string<br/>      source_ranges        = list(string)<br/>      destination_ranges   = list(string)<br/>      sources              = list(string)<br/>      targets              = list(string)<br/>      use_service_accounts = bool<br/>      priority             = number<br/>      rules = optional(list(object({<br/>        protocol = string<br/>        ports    = list(string)<br/>      })))<br/>      })),<br/>    ),<br/>  }))</pre> | `null` | Yes |

<a name="input_firewall_rules"></a>

### `firewall_rules` Details:

This input variable is a map where each key represents an identifier for a firewall configuration. The value associated with each key is an object defining the settings for that firewall, including ingress and egress rules.

#### Firewall Configuration Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `project_id` | string | The ID of the Google Cloud project where the firewall rules will be created. | Yes | |
| `network_name` | string | The name of the VPC network to which the firewall rules will be applied. | Yes | |
| `disable_default_rules_config` | bool | Determines whether the default firewall rules in the VPC are disabled. | No | |
| `ingress_rules` | optional(map(Ingress/Egress Rule Object)) | A map defining ingress firewall rules. The key of the map is a unique identifier for the rule. If not specified, no ingress rules are created. | No | |
| `egress_rules` | optional(map(Ingress/Egress Rule Object)) | A map defining egress firewall rules. The key of the map is a unique identifier for the rule. If not specified, no egress rules are created. | No | |

#### Ingress/Egress Rule Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `deny` | bool | If set to `true`, the rule denies traffic; otherwise, it allows traffic. | No | |
| `description` | string | A description of the firewall rule. | No | |
| `source_ranges` | list(string) | A list of source IP address ranges (CIDR notation) to which the rule applies. | No | |
| `destination_ranges` | list(string) | A list of destination IP address ranges (CIDR notation) to which the rule applies. | No | |
| `sources` | list(string) | A list of source tags or service accounts to which the rule applies. Can not be specified if `source_ranges` is. | No | |
| `targets` | list(string) | A list of target tags or service accounts to which the rule applies.  | No | |
| `use_service_accounts` | bool | Specifies whether to use service accounts for the source or target. | No | |
| `priority` | number | The priority of the firewall rule. Lower values indicate higher priority. | Yes | |
| `rules` | optional(list(Protocol/Ports Object)) | A list of protocol/port combinations to which the rule applies. If not specified, the rule applies to all protocols and ports. | No | |

#### Protocol/Ports Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `protocol` | string | The protocol to which the rule applies (e.g., `"tcp"`, `"udp"`, `"icmp"`). | No | |
| `ports` | list(string) | A list of port numbers or port ranges to which the rule applies (e.g., `["80", "443", "1000-2000"]`). | Yes | |