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
| [autopilot\_cluster](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/gke-cluster-autopilot | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [autopilot\_cluster](variable.tf#L1) | Map of Autopilot cluster configurations. This input allows you to define multiple Autopilot Google Kubernetes Engine (GKE) clusters. Autopilot clusters simplify GKE management by automating node provisioning and management. | <pre>map(object({<br/>    project_id                     = string<br/>    cluster_name                   = string<br/>    region                         = string<br/>    release_channel                = string<br/>    master_authorized_ranges       = map(string)<br/>    private_endpoint_subnetwork    = optional(string,null)<br/>    private_endpoint_global_access = optional(bool, false)<br/>    enable_private_nodes           = optional(bool,true)<br/>    enable_binary_authorization    = optional(bool,true)<br/>    pods_range_name                = string<br/>    services_range_name            = string<br/>    min_master_version             = optional(string)<br/>    deletion_protection            = optional(bool,false)<br/>    labels                         = optional(map(string)) # Map of labels<br/>    network_self_link              = string<br/>    subnet_self_link               = string<br/>    service_account                = string<br/>    istio = optional(object({<br/>      enable_tls = bool<br/>    }), null)<br/>    cost_management   = optional(bool, false) <br/>    gateway_api       = optional(bool, false) <br/>    mesh_certificates = optional(bool, false) <br/>    vertical_pod_autoscaling = optional(bool, false)<br/>  }))</pre> | n/a | yes |

<a name="input_autopilot_cluster"></a>

### `autopilot_cluster` Details:

This input variable is a map where each key represents a unique identifier for an Autopilot GKE cluster. The value associated with each key is an object defining the cluster's configuration.

#### Autopilot GKE Cluster Configuration Object:

| Attribute                              | Type                        | Description                                                                                                                                                              | Required | Default         |
|----------------------------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------|
| `project_id`                           | string                      | The ID of the Google Cloud project where the GKE cluster will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                      | Yes      |                 |
| `cluster_name`                         | string                      | The name of the GKE cluster. This name must be unique within the project and region. Example: `"my-autopilot-cluster"`.                                                | Yes      |                 |
| `region`                               | string                      | The region where the GKE cluster will be created. Example: `"us-central1"`.  Note, Autopilot clusters can only be *regional*, not zonal.                             | Yes      |                 |
| `release_channel`                      | string                      | Specifies the release channel for the cluster. Valid values are `"STABLE"`, `"REGULAR"`, and `"RAPID"`. Choosing a release channel determines the frequency of GKE upgrades. | Yes      |                 |
| `master_authorized_ranges`             | map(string)                 | A map of CIDR blocks that are allowed to access the cluster's master endpoint. This provides an additional layer of security by restricting access to the control plane. The key is a human readable name and the value is the CIDR block. Example: `{"home" = "1.2.3.4/32", "office" = "5.6.7.8/32"}`       | Yes      |                 |
| `private_endpoint_subnetwork`          | optional(string, null)      | The self-link of the subnetwork that the cluster's private endpoint uses. Required if `enable_private_nodes` is set to `true`.                                          | No       | `null`          |
| `private_endpoint_global_access`  | optional(bool, false)      |  Controls whether the cluster's private endpoint is globally accessible. When enabled the cluster’s private endpoint is reachable from all Vpc peered networks.                                                                                        | No       | `false`          |
| `enable_private_nodes`           | optional(bool, true)      |  Enables private nodes. Nodes are created without external (public) IP addresses.  Has limitations for some regions. Example: `true`.                                     | No       | `true`          |
| `enable_binary_authorization`          | optional(bool, true)       |  Enables Binary Authorization. Binary Authorization is a Google Cloud service that ensures only trusted container images are deployed on GKE.                                    | No       | `true`          |
| `pods_range_name`                | string                      | The name of the secondary IP range to use for pods.                                                                                                                        | Yes      |                 |
| `services_range_name`            | string                      | The name of the secondary IP range to use for services.                                                                                                                     | Yes      |                 |
| `min_master_version`           | optional(string)         | The minimum version of the master. GKE will auto-update the master to new versions, but never lower than this value. |No|         |
| `deletion_protection`             | optional(bool,false)         | If set to true, the cluster will not be deleted if someone try to destroy it.  Use this to protect your cluster from accidental deletion.   |No|         |
| `labels`                | optional(map(string))  |  Map of labels to assign to the cluster.       | No      |    |
| `network_self_link`              | string  |  The self-link of the VPC network where the cluster will be created.      | Yes     |      |
| `subnet_self_link`             | string  | The self-link of the subnetwork where the cluster will be created.       | Yes     |       |
| `service_account`              | string  | The service account to set on all nodes in the cluster. Format is '`projects/{PROJECT_ID}/serviceAccounts/{EMAIL_ADDRESS}`'      | Yes     |       |
| `istio`          | optional(object(...))       | Configuration for Istio. See Istio Object below for details. If `null`, istio is disabled.                                                                                                          | No       | `null`          |
| `cost_management`   | optional(bool, false)  | Enable the cost management feature, which is enabled by default on new Autopilot clusters after v1.28.1-gke.1088000.           | No      | `false`  |
| `gateway_api`   | optional(bool, false)  |  Enable the gateway api feature, which is enabled by default on new Autopilot clusters after v1.28.1-gke.1088000.         | No      | `false` |
| `mesh_certificates`   | optional(bool, false)  |  Enable the mesh certificates feature, which is enabled by default on new Autopilot clusters after v1.28.1-gke.1088000.         | No      | `false` |
| `vertical_pod_autoscaling`          | optional(bool, false)          |   Enable the vertical pod autoscaling feature.      | No       |  `false`       |

#### Istio Object:

| Attribute    | Type   | Description                                                                                 | Required | Default |
|--------------|--------|---------------------------------------------------------------------------------------------|----------|---------|
| `enable_tls` | bool |  Whether or not mTLS is enabled for all service mesh traffic.   | Yes      |       |
