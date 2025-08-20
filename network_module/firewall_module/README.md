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

## Resources

None

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [firewall\_rules](variable.tf#L1) | A map defining firewall rule configurations.  This input allows you to create and configure ingress and egress firewall rules for VPC networks. | <pre>map(object({<br/>    project_id                   = string<br/>    network_name                 = string<br/>    disable_default_rules_config = bool<br/>    ingress_rules = optional(map(object({<br/>      deny                 = bool<br/>      description          = string<br/>      source_ranges        = list(string)<br/>      destination_ranges   = list(string)<br/>      sources              = list(string)<br/>      targets              = list(string)<br/>      use_service_accounts = bool<br/>      priority             = number<br/>      rules = optional(list(object({<br/>        protocol = string<br/>        ports    = list(string)<br/>      })))<br/>      })),<br/>    ),<br/>    egress_rules = optional(map(object({<br/>      deny                 = bool<br/>      description          = string<br/>      source_ranges        = list(string)<br/>      destination_ranges   = list(string)<br/>      sources              = list(string)<br/>      targets              = list(string)<br/>      use_service_accounts = bool<br/>      priority             = number<br/>      rules = optional(list(object({<br/>        protocol = string<br/>        ports    = list(string)<br/>      })))<br/>      })),<br/>    ),<br/>  }))</pre> | `null` | yes |

<a name="input_firewall_rules"></a>

### `firewall_rules` Details:

This input variable is a map where each key represents a unique identifier for a set of firewall rules for a VPC network. The value associated with each key is an object defining the firewall configuration, including ingress and egress rules.

#### Firewall Rule Configuration Object:

| Attribute                  | Type                                  | Description                                                                                                                                                                                                                                                                             | Required | Default |
|----------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`               | string                                | The ID of the Google Cloud project where the firewall rules will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                                                                                                      | Yes      |         |
| `network_name`             | string                                | The name of the VPC network to which these firewall rules apply. This network must already exist. Example: `"my-vpc-network"`.                                                                                                                                                           | Yes      |         |
| `disable_default_rules_config` | bool                                  | Determines whether to disable default firewall rules. Be *extremely* careful with this; disabling default rules can severely impact network connectivity if you don't create equivalent rules. Setting this to `true` means all traffic will be blocked without other rules, even internal traffic. | Yes      |         |
| `ingress_rules`            | optional(map(object(...)))             | A map defining ingress firewall rules. The keys are unique identifiers for each rule. See "Ingress Rule Object" below for details. If `null`, no ingress rules are created.                                                                                                        | No       |         |
| `egress_rules`             | optional(map(object(...)))             | A map defining egress firewall rules. The keys are unique identifiers for each rule. See "Egress Rule Object" below for details. If `null`, no egress rules are created.                                                                                                          | No       |         |

#### Ingress/Egress Rule Object:

| Attribute             | Type             | Description                                                                                                                                | Required | Default |
|-----------------------|------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `deny`                | bool             | If set to `true`, the rule will deny traffic matching the specified criteria. If `false`, the rule will allow traffic.                        | Yes      |         |
| `description`         | string           | A description of the firewall rule.                                                                                                        | Yes      |         |
| `source_ranges`       | list(string)     | A list of source IP ranges (CIDR notation) that the rule applies to. Example: `["10.0.0.0/8", "192.168.0.0/24"]`.                              | Yes, if `sources` not used |         |
| `destination_ranges`  | list(string)     | A list of destination IP ranges (CIDR notation) that the rule applies to. Example: `["10.0.0.0/8", "192.168.0.0/24"]`.                         | Yes, if `targets` not used  |         |
| `sources`             | list(string)     | A list of source service accounts. Example: `["gserviceaccount:test@example.com"]`.   Cannot be used with `source_ranges`.                                       | Yes, if `source_ranges` not used |         |
| `targets`             | list(string)     | A list of target service accounts. Example: `["gserviceaccount:test@example.com"]`. Cannot be used with `destination_ranges`.                                      | Yes, if `destination_ranges` not used |         |
| `use_service_accounts`| bool             | *Deprecated*. Does nothing                                                                                                     | No       | `false`         |
| `priority`            | number           | The priority of the firewall rule. Lower numbers indicate higher priority. Must be between 0 and 65535.                             | Yes      |         |
| `rules`               | optional(list(object(...))) | A list of protocol and port combinations that the rule applies to. See "Rule Object" below for details. If `null`, the rule applies to all protocols and ports. | No       |         |

#### Rule Object:

| Attribute | Type     | Description                                                                                                                                                              | Required | Default |
|-----------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `protocol`| string   | The protocol that the rule applies to (e.g., `"tcp"`, `"udp"`, `"icmp"`).                                                                                              | Yes      |         |
| `ports`   | list(string) | A list of ports that the rule applies to.  Specify port numbers or port ranges. Example: `["80", "443", "1000-2000"]`.  If not specified, the rule applies to all ports for the specified protocol.                     | Yes      |         |
