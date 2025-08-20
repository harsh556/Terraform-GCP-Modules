## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.10.2 |
| [google](#requirement_google) | >= 6.13.0, < 7.0.0 |
| [google-beta](#requirement_google-beta) | >= 6.13.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [private-dns](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/dns | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [dns\_config](variable.tf#L1) | Configuration for creating and managing Cloud DNS zones (private, forwarding, peering, public) and recordsets. | <pre>map(object({<br/>    name       = string<br/>    project_id = string<br/>    zone_config = object({<br/>      domain = string<br/>      private = optional(object({<br/>        client_networks = list(string)<br/>      }))<br/>      forwarding = optional(object({<br/>        client_networks = list(string)<br/>        forwarders      = map(string)<br/>      }))<br/>      peering = optional(object({<br/>        client_networks = list(string)<br/>        peer_network    = string<br/>      }))<br/>      public = optional(object({<br/>        dnssec_config = object({<br/>          state = string<br/>        })<br/>        enable_logging = bool<br/>      }))<br/>    })<br/>    recordsets = optional(map(object({<br/>      ttl     = optional(number)<br/>      records = list(string)<br/>    })))<br/>  }))</pre> | `n/a` | yes |

<a name="input_dns_config"></a>

### `dns_config` Details:

This input variable is a map where each key represents an identifier for a Cloud DNS zone you want to create. The value associated with each key is an object defining the DNS zone's configuration.

#### DNS Zone Configuration Object:

| Attribute     | Type        | Description                                                                                                                                                          | Required | Default |
|---------------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `name`        | string      | The name of the DNS zone.  Must be unique within the project.                                                                                                    | Yes      |         |
| `project_id`  | string      | The ID of the Google Cloud project where the DNS zone will be created.                                                                                            | Yes      |         |
| `zone_config` | Zone Config Object | Configuration for the DNS zone itself (private, forwarding, peering, or public).  Only *one* of `private`, `forwarding`, `peering`, or `public` should be defined. | Yes      |         |
| `recordsets`  | optional(map(Recordset Object)) | A map defining the DNS recordsets to create within the zone. The key of the map is the record name. If not specified, no recordsets are created. | No       |         |

#### Zone Config Object:

| Attribute     | Type                                    | Description                                                                                                                                                              | Required                                               | Default |
|---------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|---------|
| `domain`      | string                                  | The DNS name of the zone (e.g., `"example.com."`).  Must end with a trailing dot.                                                                                   | Yes                                                    |         |
| `private`     | optional(Private Zone Object)           | Configuration for a private DNS zone.  Cannot be used with `forwarding`, `peering`, or `public`.                                                                     | No, but *one* of `private`, `forwarding`, `peering`, or `public` *is* required. |         |
| `forwarding`  | optional(Forwarding Zone Object)        | Configuration for a forwarding DNS zone.  Cannot be used with `private`, `peering`, or `public`.                                                                      | No, but *one* of `private`, `forwarding`, `peering`, or `public` *is* required. |         |
| `peering`     | optional(Peering Zone Object)           | Configuration for a peering DNS zone.  Cannot be used with `private`, `forwarding`, or `public`.                                                                       | No, but *one* of `private`, `forwarding`, `peering`, or `public` *is* required. |         |
| `public`      | optional(Public Zone Object)            | Configuration for a public DNS zone.  Cannot be used with `private`, `forwarding`, or `peering`.                                                                        | No, but *one* of `private`, `forwarding`, `peering`, or `public` *is* required. |         |

#### Private Zone Object:

| Attribute        | Type          | Description                                                                                                                            | Required | Default |
|------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `client_networks`| list(string)  | A list of Google Compute Engine network URLs to which this zone is visible.  Each URL should be in the format `projects/<project>/global/networks/<network>`. | Yes      |         |

#### Forwarding Zone Object:

| Attribute        | Type                 | Description                                                                                                                                                               | Required | Default |
|------------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `client_networks`| list(string)         | A list of Google Compute Engine network URLs to which this zone is visible. Each URL should be in the format `projects/<project>/global/networks/<network>`. | Yes      |         |
| `forwarders`     | map(string)          | A map of target forwarder IP addresses.  The key of the map is an arbitrary name, the value is the IP address (e.g., `{"forwarder1" = "192.168.1.1"}` ).                         | Yes      |         |

#### Peering Zone Object:

| Attribute     | Type     | Description                                                                                                                                                                     | Required | Default |
|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `client_networks`| list(string) | A list of Google Compute Engine network URLs to which this zone is visible. Each URL should be in the format `projects/<project>/global/networks/<network>`. | Yes      |         |
| `peer_network` | string   | The URL of the peer network. This should be in the format `projects/<project>/global/networks/<network>`.                                                              | Yes      |         |

#### Public Zone Object:

| Attribute     | Type                         | Description                                                                                                                                | Required | Default |
|---------------|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `dnssec_config`| DNSSEC Config Object           | Configuration for DNSSEC (DNS Security Extensions).                                                                                       | Yes      |         |
| `enable_logging` | bool                           | Specifies if query logging is enabled for this zone.                                                                                             | Yes      |         |

#### DNSSEC Config Object:

| Attribute | Type   | Description                                                                                              | Required | Default |
| --------- | ------ | -------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `state`   | string | The state of DNSSEC. Valid values: `"on"`, `"off"`, `"transfer"`.                                                    | Yes      |         |

#### Recordset Object:

| Attribute | Type          | Description                                                                                                                            | Required | Default |
| --------- | ---------------|----------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `ttl`     | optional(number) | The time-to-live (TTL) for the recordset, in seconds.                                                                                | No       |         |
| `records` | list(string)    | A list of record data for the recordset (e.g., `["10.0.0.1", "10.0.0.2"]` for an A record, `["mail.example.com."]` for a CNAME record). | Yes      |         |

