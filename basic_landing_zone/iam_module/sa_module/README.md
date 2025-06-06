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
| [service-accounts](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/iam-service-account | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [service\_accounts](variable.tf#L1) | Configuration for creating IAM service accounts and granting them permissions. | <pre>map(object({<br/>    project_id        = string<br/>    sa_name           = string<br/>    display_name      = string<br/>    prefix            = optional(string) # Optional, can be removed if not needed<br/>    description       = string<br/>    sa_users          = list(string)<br/>    iam_project_roles = list(string)<br/>  }))</pre> | `null` | yes |

<a name="input_service_accounts"></a>

### `service_accounts` Details:

This input variable is a map where each key represents an identifier for a service account you want to create. The value associated with each key is an object defining the service account's configuration.

#### Service Account Configuration Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `project_id` | string | The ID of the Google Cloud project where the service account will be created. | Yes | |
| `sa_name` | string | The name of the service account. This name must be unique within the project and follow the naming conventions for service accounts (lowercase, alphanumeric, and hyphens). | Yes | |
| `display_name` | string | The display name of the service account. This name will be shown in the Google Cloud Console and other Google services. | NO | |
| `prefix` | optional(string) | An optional prefix to add to the service account name.  If not provided, no prefix is added. | Yes | |
| `description` | string | A description of the service account's purpose. | No | |
| `sa_users` | list(string) | A list of email addresses of users who should be granted the "Service Account User" role (`roles/iam.serviceAccountUser`) on the service account. This allows them to impersonate the service account. | No | |
| `iam_project_roles` | list(string) | A list of IAM roles to grant to the service account *on the project* (e.g., `["roles/viewer", "roles/storage.objectViewer"]`). These roles define what the service account is allowed to do within the project. | No | |