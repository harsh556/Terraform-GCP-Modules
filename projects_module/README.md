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
| [project](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/project | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [projects](variable.tf#L1) |  A map of project configurations to create. This input enables the creation and configuration of multiple Google Cloud projects. | <pre>map(object({<br/>    project_name        = string<br/>    parent_id           = string<br/>    billing_account_id  = string<br/>    prefix              = optional(string)<br/>    labels              = map(string)<br/>    auto_create_network = string<br/>    deletion_policy     = string<br/>    enable_apis         = list(string)<br/>  }))</pre> | `null` | no |

<a name="input_projects"></a>

### `projects` Details:

This input variable is a map where each key represents a unique identifier for a Google Cloud project you want to create. The value associated with each key is an object defining the project's configuration.

#### Project Configuration Object:

| Attribute             | Type     | Description                                                                                                                                                              | Required | Default |
|-----------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_name`        | string   | The desired name for the Google Cloud project. This name must be globally unique across all Google Cloud projects.                                                    | Yes      |         |
| `parent_id`           | string   | The ID of the parent resource for the project (e.g., the organization or folder ID).  Specify either the organization ID or the folder ID.  Examples:  `"organizations/1234567890"` or `"folders/9876543210"`. | Yes      |         |
| `billing_account_id`  | string   | The ID of the billing account to associate with the project.  Must be a valid billing account ID.  Example:  `"012345-67890A-BCDEF0"`.                               | Yes      |         |
| `prefix`              | optional(string) | A prefix to prepend to the `project_name` to create the final project ID.  If not provided, the `project_name` is used directly as the project ID (subject to Google Cloud's project ID naming restrictions). Example:  `"my-company-"`. | No       | `""` |
| `labels`              | map(string) | A map of labels to apply to the Google Cloud project. Labels can be used for organization, filtering, and cost tracking.  Example: `{"environment" = "production", "team" = "platform"}`.                              | Yes      |         |
| `auto_create_network` | string   | Specifies whether to automatically create a default network in the project.  Valid values are `"true"` or `"false"`.  It is generally recommended to set this to `"false"` and create VPC networks explicitly. | Yes      |         |
| `deletion_policy`     | string   | Specifies the deletion policy for the project.  Valid values are `"DELETE"` or `"ABANDON"`. `"DELETE"` will delete the project when the Terraform configuration is destroyed. `"ABANDON"` will detach the project from Terraform management, leaving it active in Google Cloud.  Use `"ABANDON"` with caution. | Yes      |         |
| `enable_apis`         | list(string) | A list of Google Cloud APIs to enable on the project.  Specify the service names as strings (e.g., `["compute.googleapis.com", "container.googleapis.com"]`).  Ensure the necessary APIs are enabled for your workloads. | Yes      |         |
