## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.7.4 |
| [google](#requirement_google) | >= 6.1.0, < 7.0.0 |
| [google-beta](#requirement\_google-beta) | >= 6.1.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [cluster-nodepool](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/gke-nodepool | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [gke\_nodepool](variable.tf#L1) | A map defining GKE node pool configurations. This input allows you to define multiple node pools within a GKE cluster, specifying their machine types, autoscaling settings, and other node-specific configurations. | <pre>map(object({<br/>    project_id    = string<br/>    cluster_name  = string<br/>    location      = string<br/>    nodepool_name = string<br/>    k8s_labels    = optional(map(string))<br/>    taints = optional(map(object({<br/>      value  = string<br/>      effect = string<br/>    })))<br/>    network_tags          = optional(list(string))<br/>    service_account_email = optional(string) # optional<br/>    node_config = object({<br/>      image_type   = string<br/>      machine_type = string<br/>      disk_size_gb = number<br/>      disk_type    = string<br/>      spot         = bool<br/>    })<br/>    secondary_pod_range_name = optional(string)<br/>    autoscaling = object({<br/>      max_node_count = number<br/>      min_node_count = number<br/>    })<br/>  }))</pre> | `null` | yes |

<a name="input_gke_nodepool"></a>

### `gke_nodepool` Details:

This input variable is a map where each key represents a unique identifier for a GKE node pool. The value associated with each key is an object defining the node pool's configuration.

#### GKE Node Pool Configuration Object:

| Attribute                  | Type                        | Description                                                                                                                                                                                                                                                                                                                              | Required | Default |
|----------------------------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`               | string                      | The ID of the Google Cloud project where the GKE cluster and node pool will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                                                                                                                                      | Yes      |         |
| `cluster_name`             | string                      | The name of the GKE cluster to which this node pool will be added. The cluster must already exist. Example: `"my-gke-cluster"`.                                                                                                                                                                                                    | Yes      |         |
| `location`                 | string                      | The location (region or zone) where the node pool will be created.  For regional clusters, specify the region (e.g., `"us-central1"`). For zonal clusters, specify the zone (e.g., `"us-central1-a"`). The location must match the cluster's location.                                                                    | Yes      |         |
| `nodepool_name`            | string                      | The name of the node pool. This name must be unique within the cluster. Example: `"my-nodepool"`.                                                                                                                                                                                                                                | Yes      |         |
| `k8s_labels`               | optional(map(string))        | A map of Kubernetes labels to apply to the nodes in the node pool. Labels can be used for node affinity, pod scheduling, and other Kubernetes features. Example: `{"role" = "worker", "environment" = "production"}`.                                                                                                    | No       |         |
| `taints`                   | optional(map(object(...)))    | A map of node taints to apply to the nodes in the node pool. Taints are used to repel pods from nodes unless they have a matching toleration. See "Taints Object" below for details.                                                                                                                                              | No       |         |
| `network_tags`             | optional(list(string))      | A list of network tags to apply to the nodes in the node pool. These tags are used to identify and group nodes for firewall rules and network configuration. Example: `["web", "backend"]`.                                                                                                                                   | No       |         |
| `service_account_email`    | optional(string)            | The email address of the service account to associate with the nodes in the node pool. This service account will be used to authenticate the nodes with other Google Cloud services.                                                                                                                                               | No       |         |
| `node_config`              | object(...)                 | Configuration for the nodes in the node pool. See "Node Configuration Object" below for details.                                                                                                                                                                                                                         | Yes      |         |
| `secondary_pod_range_name` | optional(string)            | The name of the secondary IP range to use for pods in this node pool. This range must have already been created in the cluster's VPC network. If not specified, the cluster's default pod range is used.                                                                                                                 | No       |         |
| `autoscaling`              | object(...)                 | Configuration for autoscaling the node pool. See "Autoscaling Object" below for details.                                                                                                                                                                                                                               | Yes      |         |

#### Taints Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `value` | string | The value of the taint. | Yes | |
| `effect` | string | The effect of the taint. Valid values are `"NoSchedule"`, `"PreferNoSchedule"`, and `"NoExecute"`. | Yes | |

#### Node Configuration Object:

| Attribute   | Type     | Description                                                                                                                                                                    | Required | Default |
|-------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `image_type`| string   | The image to use for the nodes in the node pool. Example: `"ubuntu-os-cloud/ubuntu-2004-lts"`.                                                                                 | Yes      |         |
| `machine_type` | string   | The machine type to use for the nodes in the node pool. Example: `"n1-standard-1"`.                                                                                             | Yes      |         |
| `disk_size_gb`| number   | The size of the boot disk for the nodes in GB. Example: `50`.                                                                                                                  | Yes      |         |
| `disk_type` | string   | The type of the boot disk for the nodes. Example: `"pd-standard"`. Valid values are `"pd-standard"`, `"pd-ssd"`, and `"pd-balanced"`.                                           | Yes      |         |
| `spot`        | bool     | Specifies whether to use Spot VMs for the nodes in the node pool. Spot VMs are preemptible and can be significantly cheaper, but they may be terminated with little notice. | Yes      |         |

#### Autoscaling Object:

| Attribute       | Type   | Description                                                                                                                                | Required | Default |
|-----------------|--------|--------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `max_node_count`| number | The maximum number of nodes that the node pool can scale up to.                                                                          | Yes      |         |
| `min_node_count`| number | The minimum number of nodes that the node pool will maintain.                                                                              | Yes      |         |
