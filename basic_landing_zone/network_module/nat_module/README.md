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
| [nat](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-cloudnat | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [cloud\_nat](variable.tf#L1) | Configuration for creating Cloud NAT gateways. | <pre>map(object({<br/>    nat_name       = string<br/>    project_id     = string<br/>    region         = string<br/>    router_network = string<br/>    router_name    = string<br/>  }))</pre> | `null` | Yes |

<a name="input_cloud_nat"></a>

### `cloud_nat` Details:

This input variable is a map where each key represents an identifier for a Cloud NAT gateway you want to create. The value associated with each key is an object defining the Cloud NAT gateway's configuration.

#### Cloud NAT Configuration Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `nat_name` | string | The name of the Cloud NAT gateway. This name must be unique within the region. | Yes | |
| `project_id` | string | The ID of the Google Cloud project where the Cloud NAT gateway will be created. | Yes | |
| `region` | string | The region where the Cloud NAT gateway will be created (e.g., `"us-central1"`). | Yes | |
| `router_network` | string | The name of the VPC network associated with the router. | Yes | |
| `router_name` | string | The name of the Cloud Router to associate with the Cloud NAT gateway. The router must already exist. | Yes | |