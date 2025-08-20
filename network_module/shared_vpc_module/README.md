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
| [host-project](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |
| [service-project](main.tf#L2) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [shared\_vpc](variable.tf#L1) | A map defining Shared VPC configurations.  This input enables the configuration of Shared VPC, linking service projects to a host project and granting network access to specific users or service accounts. | <pre>map(object({<br/>    host_project_id      = string<br/>    service_project_id   = string<br/>    network_users        = optional(list(string))<br/>    network_subnet_users = optional(map(list(string)))<br/>  }))</pre> | `null` | yes |

<a name="input_shared_vpc"></a>

### `shared_vpc` Details:

This input variable is a map where each key represents a unique identifier for a Shared VPC configuration. The value associated with each key is an object defining the Shared VPC setup.

#### Shared VPC Configuration Object:

| Attribute             | Type     | Description                                                                                                                                                              | Required | Default |
|-----------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `host_project_id`     | string   | The ID of the host project. This is the project where the Shared VPC network resides.  Must be a valid Google Cloud project ID.  Example: `"my-host-project-123"`.             | Yes      |         |
| `service_project_id`  | string   | The ID of the service project. This is the project that will use the Shared VPC network.  Must be a valid Google Cloud project ID. Example: `"my-service-project-456"`.         | Yes      |         |
| `network_users`       | optional(list(string)) | A list of members (users or service accounts) who should have the `compute.networkUser` role on the host project.  This allows them to create resources that use the Shared VPC network.  Example: `["user:test@example.com", "serviceAccount:my-sa@my-project.iam.gserviceaccount.com"]`. | No       |         |
| `network_subnet_users`  | optional(map(list(string))) | A map defining subnet-specific network users. The keys of the map are subnet names and the values are lists of members (users or service accounts) who should have the `compute.networkUser` role on the subnet.  This allows granular control over which users can access specific subnets within the Shared VPC network. Example: `{"subnet-a" = ["user:test@example.com"], "subnet-b" = ["serviceAccount:my-sa@my-project.iam.gserviceaccount.com"]}`. | No       |         |
