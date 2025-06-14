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
| [host-project](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |
| [service-project](main.tf#L11) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [shared\_vpc](variable.tf#L1) | Configuration for setting up Shared VPC between a host project and service projects. | <pre>map(object({<br/>    host_project_id      = string<br/>    service_project_id   = string<br/>    network_users        = optional(list(string))<br/>    network_subnet_users = optional(map(list(string)))<br/>  }))</pre> | `null` | Yes |

<a name="input_shared_vpc"></a>

### `shared_vpc` Details:

This input variable is a map where each key represents an identifier for a Shared VPC configuration. The value associated with each key is an object defining the relationship between the host project and service projects, as well as the permissions granted.

#### Shared VPC Configuration Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `host_project_id` | string | The ID of the Google Cloud project that will act as the Shared VPC host project. | Yes | |
| `service_project_id` | string | The ID of the Google Cloud project that will be attached as a service project to the Shared VPC host. | Yes | |
| `network_users` | optional(list(string)) | A list of IAM principals (users, groups, or service accounts) that should be granted the `compute.networkUser` role on the host project. This allows them to create resources in the Shared VPC network. Use the fully qualified principal identifier (e.g., `"user:test@example.com"`, `"group:admins@example.com"`, `"serviceAccount:my-sa@project.iam.gserviceaccount.com"`). | No | |
| `network_subnet_users` | optional(map(list(string))) |  A map where each key is a subnet name and the value is a list of IAM principals (users, groups, or service accounts).  These principals will be granted the `compute.networkUser` role specifically on that subnet in the host project. This allows fine-grained control over which principals can use which subnets. Use the fully qualified principal identifier (e.g., `"user:test@example.com"`). | No | |