## Requirements

| Name | Version |
|------|---------|
| [google](#requirement_google) | >= 6.21.0, < 7.0.0 |
| [google-beta](#requirement_google-beta) | >= 6.21.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [standard\_cluster](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/gke-cluster-standard | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [standard\_cluster](variable.tf#L1) | Map of Standard GKE cluster configurations. This input allows you to define multiple Standard Google Kubernetes Engine (GKE) clusters with their configurations, including network settings, security features, and autoscaling options. | <pre>map(object({<br/>    project_id                     = string<br/>    cluster_name                   = string<br/>    region                         = string<br/>    release_channel                = string<br/>    max_pods_per_node              = optional(number, 110)<br/>    master_authorized_ranges       = map(string)<br/>    private_endpoint_subnetwork    = optional(string, null)<br/>    private_endpoint_global_access = optional(bool, false)<br/>    enable_private_nodes           = optional(bool, true)<br/>    enable_binary_authorization    = optional(bool, true)<br/>    pods_range_name                = string<br/>    services_range_name            = string<br/>    min_master_version             = optional(string)<br/>    deletion_protection            = optional(bool,false)<br/>    labels                         = map(string) # Map of labels<br/>    network_self_link                  = string<br/>    subnet_self_link               = string<br/>    service_account                = string<br/>    horizontal_pod_autoscaling     = optional(bool, false)<br/>    http_load_balancing            = optional(bool, false)<br/>    istio = optional(object({<br/>      enable_tls = bool<br/>    }), null)<br/>    cost_management          = optional(bool, false)<br/>    gateway_api              = optional(bool, false)<br/>    mesh_certificates        = optional(bool, false)<br/>    vertical_pod_autoscaling = optional(bool, false)<br/>    workload_identity        = optional(bool, true)<br/>    cluster_autoscaling = optional(object({<br/>      enabled             = optional(bool)<br/>      autoscaling_profile = optional(string, "BALANCED")<br/>      auto_provisioning_defaults = optional(object({<br/>        boot_disk_kms_key = optional(string)<br/>        disk_size         = optional(number)<br/>        disk_type         = optional(string, "pd-standard")<br/>        image_type        = optional(string)<br/>        oauth_scopes      = optional(list(string))<br/>        service_account   = optional(string)<br/>        management = optional(object({<br/>          auto_repair  = optional(bool, true)<br/>          auto_upgrade = optional(bool, true)<br/>        }))<br/>        shielded_instance_config = optional(object({<br/>          integrity_monitoring = optional(bool, true)<br/>          secure_boot          = optional(bool, false)<br/>        }))<br/>        upgrade_settings = optional(object({<br/>          blue_green = optional(object({<br/>            node_pool_soak_duration = optional(string)<br/>            standard_rollout_policy = optional(object({<br/>              batch_percentage    = optional(number)<br/>              batch_node_count    = optional(number)<br/>              batch_soak_duration = optional(string)<br/>            }))<br/>          }))<br/>          surge = optional(object({<br/>            max         = optional(number)<br/>            unavailable = optional(number)<br/>          }))<br/>        }))<br/>        # add validation rule to ensure only one is present if upgrade settings is defined<br/>      }), null)<br/>      cpu_limits = optional(object({<br/>        min = optional(number, 0)<br/>        max = number<br/>      }))<br/>      mem_limits = optional(object({<br/>        min = optional(number, 0)<br/>        max = number<br/>      }))<br/>      accelerator_resources = optional(list(object({<br/>        resource_type = string<br/>        min           = optional(number, 0)<br/>        max           = number<br/>      })))<br/>    }), null)<br/>  }))</pre> | n/a | yes |

<a name="input_standard_cluster"></a>

### `standard_cluster` Details:

This input variable is a map where each key represents a unique identifier for a Standard GKE cluster. The value associated with each key is an object defining the cluster's configuration.

#### Standard GKE Cluster Configuration Object:

| Attribute                              | Type                        | Description                                                                                                                                                                                      | Required | Default         |
|----------------------------------------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------|
| `project_id`                           | string                      | The ID of the Google Cloud project where the GKE cluster will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                            | Yes      |                 |
| `cluster_name`                         | string                      | The name of the GKE cluster. This name must be unique within the project and region. Example: `"my-gke-cluster"`.                                                                              | Yes      |                 |
| `region`                               | string                      | The region where the GKE cluster will be created. Example: `"us-central1"`. For zonal clusters, it must be zone. Example `"us-central1-a"`                                                                                                         | Yes      |                 |
| `release_channel`                      | string                      | Specifies the release channel for the cluster. Valid values are `"STABLE"`, `"REGULAR"`, and `"RAPID"`.  Choosing a release channel determines the frequency of GKE upgrades.              | Yes      |                 |
| `max_pods_per_node`                    | optional(number, 110)       | The maximum number of pods that can run on each node in the cluster. Defaults to 110.                                                                                                      | No       | `110`           |
| `master_authorized_ranges`             | map(string)                 | A map of CIDR blocks that are allowed to access the cluster's master endpoint. This provides an additional layer of security by restricting access to the control plane. The key is a human readable name and the value is the CIDR block. Example: `{"home" = "1.2.3.4/32", "office" = "5.6.7.8/32"}` | Yes   |                |
| `private_endpoint_subnetwork`          | optional(string, null)      | The self-link of the subnetwork that the cluster's private endpoint uses. Required if `enable_private_nodes` is set to `true`.                                                              | No       | `null`          |
| `private_endpoint_global_access`        | optional(bool, false)          |  Controls whether the cluster's private endpoint is globally accessible. When enabled the cluster’s private endpoint is reachable from all Vpc peered networks.                                                                                        | No       | `false`          |
| `enable_private_nodes`           | optional(bool, true)      |  Enables private nodes. Nodes are created without external (public) IP addresses. Has limitations for some regions. Example: `true`.                                                              | No       |    `true`             |
| `enable_binary_authorization`          | optional(bool, true)       |  Enables Binary Authorization. Binary Authorization is a Google Cloud service that ensures only trusted container images are deployed on GKE.                                          | No       | `true`          |
| `pods_range_name`                | string                      | The name of the secondary IP range to use for pods.                                                                                                                                              | Yes      |                 |
| `services_range_name`            | string                      | The name of the secondary IP range to use for services.                                                                                                                                           | Yes      |                 |
| `min_master_version`             | optional(string)         | The minimum version of the master. GKE will auto-update the master to new versions, but never lower than this value. |No| |
| `deletion_protection`             | optional(bool,false)         | If set to true, the cluster will not be deleted if someone try to destroy it. |No| |
| `labels`                | map(string)  |  Map of labels to assign to the cluster.       | Yes      |     |
| `network_self_link`            | string  |  The self-link of the VPC network where the cluster will be created.         | Yes      |     |
| `subnet_self_link`             | string  | The self-link of the subnetwork where the cluster will be created.        | Yes     |      |
| `service_account`              | string  |  The service account to set on all nodes in the cluster. Format is '`projects/{PROJECT_ID}/serviceAccounts/{EMAIL_ADDRESS}`'        | Yes     |      |
| `horizontal_pod_autoscaling`   | optional(bool, false)  | Enable the horizontal pod autoscaling feature.          | No      | `false` |
| `http_load_balancing`   | optional(bool, false)  | Enable the http load balancing feature.          | No      | `false` |
| `istio`          | optional(object(...))       | Configuration for Istio. See Istio Object below for details. If `null`, istio is disabled.                                                                                                          | No       |  `null`        |
| `cost_management`   | optional(bool, false)  |  Enable the cost management feature.         | No      | `false` |
| `gateway_api`   | optional(bool, false)  |  Enable the gateway api feature.         | No      | `false` |
| `mesh_certificates`   | optional(bool, false)  |  Enable the mesh certificates feature.         | No      | `false` |
| `vertical_pod_autoscaling`          | optional(bool, false)          |  Enable the vertical pod autoscaling feature.        | No       |  `false`        |
| `workload_identity`   | optional(bool, true)  | Enable the workload identity feature.          | No      | `true` |
| `cluster_autoscaling`   | optional(object(...), null)  | Configuration for the Cluster Autoscaler.  If `null`, cluster autoscaling is disabled. See "Cluster Autoscaling Object" below for details.       | No      | `null` |

#### Istio Object:

| Attribute    | Type   | Description                                                                                 | Required | Default |
|--------------|--------|---------------------------------------------------------------------------------------------|----------|---------|
| `enable_tls` | bool |  Whether or not mTLS is enabled for all service mesh traffic.   | Yes      |       |

#### Cluster Autoscaling Object:

| Attribute                   | Type                        | Description                                                                                                                                                                     | Required | Default          |
|-----------------------------|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------|
| `enabled` | optional(bool) | Enable the cluster autoscaling feature. |No||
| `autoscaling_profile`          | optional(string, "BALANCED")            | Specifies the node auto-provisioning auto-scaling profile. Valid values are `"BALANCED"` and `"OPTIMIZE_UTILIZATION"`.   It must be specified if node auto-provisioning is enabled.                              | No   |`"BALANCED"`          |
| `auto_provisioning_defaults`| optional(object(...), null) | Configuration for Node Auto-Provisioning defaults.  It must be specified if node auto-provisioning is enabled.      See "Auto Provisioning Default Object" below for details.                                                                                           | No        |   `null`      |
| `cpu_limits`          | optional(object(...))       | The CPU requirements for the cluster.  Must be set of cluster autoscaling is turned on. See "CPU limits Object" below for details.  If not specified or 0, that value does not restrict CPU limits. | No  | |
| `mem_limits`   | optional(object(...))         | The memory requirements for the cluster. Must be set if cluster autoscaling is turned on. See "Memory limits Object" below for details. If not specified or 0, that value does not restrict memory limits.         | No      |    |
| `accelerator_resources` | optional(list(object(...))) | Contains the gpus configuration for the autoscaling. If `[]` is set, that means that there are no requirements for the GPUs.  | No  | |

#### Auto Provisioning Default Object:

| Attribute               | Type                | Description                                                                                                                                                                                                                                   | Required | Default         |
|-------------------------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------|
| `boot_disk_kms_key`   | optional(string)    | KMS key used to encrypt the boot disk attached to each node in the node pool.                                                                                                                                                           | No       |                 |
| `disk_size`        | optional(number) |  Size of the disk attached to each node in the node pool.   This is in GB and defaults to a size of 100GB.        | No       |                 |
| `disk_type`       | optional(string, "pd-standard")    |   Type of the disk attached to each node in the node pool.   Valid values are `"pd-standard"`, `"pd-ssd"`, `"pd-balanced"`. Defaults to `"pd-standard"`.                     | No       |`"pd-standard"`         |
| `image_type`   | optional(string)         |  ImageType of the image used for the cluster, the default will be `COS_CONTAINERD`.      The default value is the Container-Optimized OS image (`COS_CONTAINERD`)  | No |         |
| `oauth_scopes`   | optional(list(string))          |  Scopes that are used by NAP when creating node pools.  If oauth_scopes is empty, default Google access scopes will be used.    List of scopes can be found here: (https://cloud.google.com/sdk/gcloud/reference/container/node-pools/create#--scopes)      | No |         |
| `service_account`   | optional(string)          |  The Google Cloud Platform Service Account to be used by the node VMs..      If service_account is empty, default Google access scopes will be used.    Service account must have at least `compute.instanceAdmin` role.  | No |        |
| `management`              | optional(object(...))       | Specifies the management settings for the node pool. See "Management Object" below for details.            | No      |                         |
| `shielded_instance_config`      | optional(object(...))       | Defines the shielded instance configuration for the node pool. See "Shielded Instance Config" below for details.            | No      |                         |
| `upgrade_settings`              | optional(object(...))       | Settings for upgrading the nodes in the node pool. Only one upgrade settings can be configured.     If blue_green or surge is not defined, then the default settings are used.                   | No      |                         |

#### Management Object:

| Attribute            | Type    | Description                                                                                                                                          | Required | Default |
|----------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `auto_repair`      | optional(bool, true)  |  Specifies whether the node auto-repair is enabled for the node group. If auto_repair is not defined, the "default" value is true.             | No      | `true`   |
| `auto_upgrade`   | optional(bool, true)     |  Specifies whether node auto-upgrade is enabled for the node group. If auto_upgrade is not defined, the "default" value is true.          | No      |  `true`  |

#### Shielded Instance Config Object:

| Attribute              | Type    | Description                                                                                                                                          | Required | Default |
|------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `integrity_monitoring` | optional(bool, true)  |  Defines whether the instance has integrity monitoring enabled. Enables monitoring and attestation of the boot environment's integrity. The instance is monitored against corruption and unauthorized changes. | No      | `true`   |
| `secure_boot`          | optional(bool, false) |  Defines whether the instance has secure boot enabled. Secure boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails.  | No      | `false`  |

#### Upgrade Settings Object:
Only one upgrade settings can be configured at the same time between blue_green and surge.

| Attribute         | Type           | Description                                                                                                                                                                 | Required | Default  |
|-------------------|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------|
| `blue_green`  | optional(object(...))    | Used for Blue Green upgrade strategy.      See "Blue Green Object" below for details.  | No      |            |
| `surge`  | optional(object(...))    | Used for surge upgrade strategy.       See "Surge Object" below for details.    | No      |            |

#### Blue Green Object:
This object can not be declared together with the surge block

| Attribute                  | Type    | Description                                                                                                                                    | Required | Default |
|----------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `node_pool_soak_duration` | optional(string) |  Specifies the soak time after each blue-green upgrade. Used to check for issues, defaults to zero.  The following suffixes are accepted:   `s` (seconds), `m` (minutes), `h` (hours).  | No      |        |
| `standard_rollout_policy` | optional(object(...)) | Contains the detail information about the standard rollout policy.  See "Standard Rollout Policy" object below for details.               | No      |            |

#### Standard Rollout Policy Object:

| Attribute              | Type    | Description                                                                                                                                    | Required | Default |
|----------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `batch_percentage` | optional(number) |  Percentage of nodes upgraded per batch. Each batch contains the number of nodes that match the percentage of nodes in the node pool.   Example 5(%).          The default value is 0.  | No      |        |
| `batch_node_count`    | optional(number)     | Number of nodes upgraded per batch. Each batch contains the number of nodes that match the batch_node_count or batch_percentage, whichever results in the smaller number of nodes.    The default value is 0.  | No      |            |
| `batch_soak_duration` | optional(string) | Specifies the soak time for each batch after blue-green upgrades. Used to check for issues, defaults to zero. The following suffixes are accepted:   `s` (seconds), `m` (minutes), `h` (hours).     | No      |        |

#### Surge Object:
This object can not be declared together with the blue_green block

| Attribute       | Type     | Description                                                                                                                                           | Required | Default |
|-----------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `max`         | optional(number)   | The maximum number of nodes that can be created beyond the current size of the node pool during the upgrade process. A node pool can have at most 20% surge above its current size. Examples values: 10(absolute), 10%(relative to the node pool size).  Must be an integer value or end with “%”.   | No      |        |
| `unavailable`   | optional(number)  | The maximum number of nodes that can be simultaneously unavailable during the upgrade process. A node pool can have at most 20% unavailable (missing) nodes relative to its size. If a value is not specified, the number of unavailable nodes is determined based on the pool's size. Examples values: 10(absolute), 10%(relative to the node pool size). Must be an integer value or end with “%”.  | No   |   |

#### CPU Limits Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `min` | optional(number, 0) | The minimum CPU limit.  If specified and greater than 0, will limit CPU consumption to after the defined value.
 |No      | `0`         |
| `max` | number | The maximum CPU limit.  Must be specified.       |yes| |

#### Memory Limits Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `min` | optional(number, 0) | The minimum memory limit in gibibytes (GiB). If specified and greater than 0, will limit memory consumption to after the defined value.
 |No      | `0`         |
| `max` | number | The maximum memory limit in gibibytes (GiB).  Must be specified. |yes| |

#### Accelerator Resources Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `resource_type` | string | The accelerator type, such as nvidia-tesla-t4. |yes| |
| `min` | optional(number, 0) | The minimum number of accelerator resources.  If specified and greater than 0, will limit GPU consumption to after the defined value.
 |No      | `0`         |
| `max` | number | The maximum number of accelerator resources.        |yes| |
