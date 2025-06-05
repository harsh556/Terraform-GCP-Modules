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
| [project](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/project | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [projects](variable.tf#L1) | Configuration for creating Google Cloud projects. | <pre>map(object({<br/>    project_name        = string<br/>    parent_id           = string<br/>    billing_account_id  = string<br/>    prefix              = optional(string)<br/>    labels              = map(string)<br/>    auto_create_network = string<br/>    deletion_policy     = string<br/>    enable_apis         = list(string)<br/>  }))</pre> | `null` | Yes |

<a name="input_projects"></a>

### `projects` Details:

This input variable is a map where each key represents an identifier for a project you want to create. The value associated with each key is an object defining the project's configuration.

#### Project Configuration Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `project_name` | string | The name of the project (without the prefix). This will be combined with the `prefix` (if provided) to create the final project ID. The project ID must be globally unique. | Yes | |
| `parent_id` | string | The ID of the parent resource for the project (organization or folder).  This should be in the format `"organizations/xxxxxxxxxxx"` or `"folders/xxxxxxxxxxx"`. | Yes | |
| `billing_account_id` | string | The ID of the billing account to associate with the project. | Yes | |
| `prefix` | optional(string) | An optional prefix to add to the project name to form the project ID. If not provided, no prefix is added. | No | |
| `labels` | map(string) | A map of labels to apply to the project. | No | |
| `auto_create_network` | string | Whether to automatically create a default network in the project. Valid values are `"true"` or `"false"`. | Yes | |
| `deletion_policy` | string | The deletion policy for the project. Valid values are `"DELETE"` or `"ABANDON"`. `"DELETE"` will delete the project when the Terraform resource is destroyed. `"ABANDON"` will detach the project from Terraform management, leaving it active in Google Cloud. | Yes | |
| `enable_apis` | list(string) | A list of API names to enable on the project (e.g., `["compute.googleapis.com", "container.googleapis.com"]`). | No | |