## Requirements

| Name | Version |
|------|---------|
| [google](#requirement_google) | >= 6.0.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [memorystore](main.tf#L1) | github.com/terraform-google-modules/terraform-google-memorystore/modules/redis-cluster | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [enable\_memorystore\_creation](variables.tf#L1) | Enables or disables the creation of Memorystore Redis clusters. Setting this to `false` prevents any Memorystore Redis cluster resources from being created. | `bool` | `true` | no |
| [memorystore](#input_memorystore) | Configuration for Memorystore Redis clusters in a map format. This input allows you to define multiple Redis clusters with their configurations, including shard count, region, node type, Redis configs, and service connection policies. | <pre>map(object({<br/>    project_id              = string<br/>    instance_name           = string<br/>    shard_count             = number<br/>    region                  = string<br/>    replica_count           = optional(number, 0)<br/>    transit_encryption_mode = optional(string)<br/>    authorization_mode      = optional(string, "AUTH_MODE_DISABLED")<br/>    node_type               = string<br/>    redis_configs = optional(object({<br/>      maxmemory-clients       = optional(string)<br/>      maxmemory               = optional(string)<br/>      maxmemory-policy        = optional(string)<br/>      notify-keyspace-events  = optional(string)<br/>      slowlog-log-slower-than = optional(number)<br/>      maxclients              = optional(number)<br/>    }))<br/>    service_connection_policies = map(object({<br/>      description     = optional(string)<br/>      network_name    = string<br/>      network_project = string<br/>      subnet_names    = list(string)<br/>      limit           = optional(number)<br/>      labels          = optional(map(string), {})<br/>    }))<br/>    # List of consumer network where the network address of the discovery endpoint will be reserved. Currently, only one item is supported.<br/>    network                       = list(string)<br/>    zone_distribution_config_mode = optional(string, "MULTI_ZONE")<br/>    zone_distribution_config_zone = optional(string, null)<br/>    deletion_protection_enabled   = optional(bool, false)<br/><br/>    labels = optional(map(string))<br/><br/><br/>  }))</pre> | n/a | yes |

<a name="input_enable_memorystore_creation"></a>

### `enable_memorystore_creation` Details:

This boolean variable controls whether the Memorystore Redis clusters are created. Set to `false` to prevent the creation of any Redis cluster resources. This can be useful for conditional deployments or disabling Redis clusters in certain environments.

<a name="input_memorystore"></a>

### `memorystore` Details:

This input variable is a map where each key represents a unique identifier for a Memorystore Redis cluster. The value associated with each key is an object defining the cluster's configuration.

#### Memorystore Redis Cluster Configuration Object:

| Attribute                       | Type                        | Description                                                                                                                                                           | Required | Default                 |
|---------------------------------|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------------|
| `project_id`                    | string                      | The ID of the Google Cloud project where the Redis cluster will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                  | Yes      |                         |
| `instance_name`                 | string                      | The name of the Redis cluster. This name must be unique within the project and region. Example: `"my-redis-cluster"`.                                                 | Yes      |                         |
| `shard_count`                   | number                      | The number of shards in the Redis cluster.                                                                                                                            | Yes      |                         |
| `region`                        | string                      | The region where the Redis cluster will be created. Example: `"us-central1"`.                                                                                                          | Yes      |                         |
| `replica_count`                 | optional(number, 0)         | The number of replica nodes per shard. Defaults to 0 (no replicas).                                                                                                   | No       | `0`                     |
| `transit_encryption_mode`       | optional(string)            | Specifies the transit encryption mode. Valid values are `"DISABLED"` and `"PREFERRED"`. If not specified, the default encryption mode is used.                           | No       |                         |
| `authorization_mode`        | optional(string, "AUTH_MODE_DISABLED") |  The authorization mode, which enables or disables clients to connect using RESP protocol with valid AUTH string after the connection. Default value is `AUTH_MODE_DISABLED`.  Allowed values: "AUTH_MODE_DISABLED", "AUTH_MODE_USER". |No  | `"AUTH_MODE_DISABLED"`                        |
| `node_type`                     | string                      | The type of Redis nodes to use for the cluster. Example: `"redis-enterprise-c1"` (See Google Cloud documentation for available node types).                                   | Yes      |                         |
| `redis_configs`                 | optional(object(...))       | Configuration for Redis-specific settings. See "Redis Configuration Object" below for details.                                                                      | No       |                         |
| `service_connection_policies` | map(object(...))            | Map of service connection policy configuration.  See "Service Connection Policies Object" below for details.                                                             | No      |      |
| `network`                      | list(string)               | A list containing a consumer network self-link where the discovery endpoint will be reserved.   Currently, only one value is supported. This network is where your application connects to the Redis cluster.   Example: `["https://www.googleapis.com/compute/v1/projects/my-project/global/networks/my-network"]`.   |Yes       |                         |
| `zone_distribution_config_mode`       | optional(string, "MULTI_ZONE")            |  This configures the distribution of the user's shards among availabilility zones.  One of "SINGLE_ZONE", "MULTI_ZONE". |  No      | `"MULTI_ZONE"`                         |
| `zone_distribution_config_zone`  | optional(string, null)      | When zone_distribution_config_mode is "SINGLE_ZONE", it needs to have a valid Google Cloud zone defined.                       |   No     | `null`                |
| `deletion_protection_enabled`    | optional(bool, false)  |  Whether cluster level deletion protection is enabled. This means that the cluster cannot be deleted using the terraform destroy or google console.
| `labels`                        | optional(map(string))        | A map of labels to apply to the Redis cluster. Labels can be used for organization, filtering, and cost tracking. Example: `{"environment" = "production", "team" = "data"}`. | No       |                         |

#### Redis Configuration Object:

| Attribute                  | Type     | Description                                                                                                                                            | Required | Default |
|----------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `maxmemory-clients`        | optional(string) |  Sets the maxmemory policy for client connections.                                                                                                    | No      |         |
| `maxmemory`                | optional(string)  |  Sets the maxmemory setting for the Redis instance. This controls the maximum amount of memory that Redis will use.                                         | No       |         |
| `maxmemory-policy`         | optional(string)  |  Sets the eviction policy for the Redis instance. Determines how Redis will evict keys when it reaches the `maxmemory` limit.                              | No       |         |
| `notify-keyspace-events`   | optional(string) |  Configures which key space events Redis will publish to Pub/Sub.                                                                                      | No       |         |
| `slowlog-log-slower-than`  | optional(number) |  Configures the slow log, which logs queries that take longer than a specified number of microseconds to execute.                                        | No       |         |
| `maxclients`               | optional(number)  |  Sets the maximum number of connected clients allowed to connect to the Redis instance at the same time.                                                | No       |         |

#### Service Connection Policies Object:

| Attribute          | Type     | Description                                                                                                                                                      | Required | Default |
|--------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `description`      | optional(string) | A description of the service connection policy.                                                                                                                | No      |         |
| `network_name`     | string   | The name of the service connection policy.                                                                                                                     | Yes      |         |
| `network_project`  | string   | The project where the service connection policy resides.                                                                                                         | Yes      |         |
| `subnet_names`     | list(string) | A list of subnet names associated with this connection policy. | Yes  |  |
| `limit`            | optional(number) |  The number of consumer projects that can, at the same time, use the service connection policy.   Not yet Implemented,  For more details, please check the documentation.                        | No      |         |
| `labels`           | optional(map(string), {}) | A map of labels to apply to the service connection policy.                                                                                               | No       | `{}`    |
