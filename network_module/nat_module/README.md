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
| [nat](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-cloudnat | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [cloud\_nat](variable.tf#L1) | A map defining Cloud NAT configurations. This input allows you to create and configure Cloud NAT gateways for enabling internet access to VMs in private subnets. | <pre>map(object({<br/>    nat_name       = string<br/>    project_id     = string<br/>    region         = string<br/>    router_network = string<br/>    router_name    = string<br/>  }))</pre> | `null` | yes |

<a name="input_cloud_nat"></a>

### `cloud_nat` Details:

This input variable is a map where each key represents a unique identifier for a Cloud NAT configuration. The value associated with each key is an object defining the Cloud NAT gateway's settings.

#### Cloud NAT Configuration Object:

| Attribute      | Type     | Description                                                                                                                                                                    | Required | Default |
|----------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `nat_name`     | string   | The name of the Cloud NAT gateway. This name must be unique within the region and project. Example: `"my-nat-gateway"`.                                                       | Yes      |         |
| `project_id`   | string   | The ID of the Google Cloud project where the Cloud NAT gateway will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                           | Yes      |         |
| `region`       | string   | The region where the Cloud NAT gateway will be created. Example: `"us-central1"`.                                                                                             | Yes      |         |
| `router_network` | string | The self-link of the network this NAT belongs to. The network must exist, otherwise NAT creation will fail. Example: `"https://www.googleapis.com/compute/v1/projects/gcp-project-id/global/networks/network-name"` | Yes      |         |
| `router_name`  | string   | The name of the Cloud Router that will be used to manage the Cloud NAT gateway. This router must already exist.  Example: `"my-cloud-router"`.                                | Yes      |         |
