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
| [service\_accounts](#input_service_accounts) | A map defining service account configurations. This input allows you to create and configure multiple service accounts within a Google Cloud project, including setting display names, descriptions, users, and IAM roles. | <pre>map(object({<br/>    project_id        = string<br/>    sa_name           = string<br/>    display_name      = string<br/>    prefix            = optional(string) # Optional, can be removed if not needed<br/>    description       = string<br/>    sa_users          = list(string)<br/>    iam_project_roles = list(string)<br/>  }))</pre> | `null` | yes |

<a name="input_service_accounts"></a>

### `service_accounts` Details:

This input variable is a map where each key represents a unique identifier for a service account. The value associated with each key is an object defining the service account's configuration.

#### Service Account Configuration Object:

| Attribute             | Type                        | Description                                                                                                                                                                | Required | Default |
|-----------------------|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`          | string                      | The ID of the Google Cloud project where the service account will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                       | Yes      |         |
| `sa_name`             | string                      | The name (also known as the local part of the email address) of the service account. This name must be unique within the project. Example: `"my-service-account"`.        | Yes      |         |
| `display_name`        | string                      | The display name for the service account. This is a human-readable name that is shown in the Google Cloud Console. Example: `"My Service Account"`.                             | Yes      |         |
| `prefix`              | optional(string)            | A prefix to prepend to the `sa_name` to create the final service account ID (the part before `@` in the email address). Useful for ensuring uniqueness or following a naming convention. If not provided, the `sa_name` is used directly. Example: `"dev-"`.     | No       |         |
| `description`         | string                      | A description of the service account. This description is also shown in the Google Cloud Console.                                                                           | Yes      |         |
| `sa_users`            | list(string)                | A list of members (users or service accounts) who should be granted the `iam.serviceAccountUser` role on the service account. This allows these members to impersonate the service account. Example: `["user:test@example.com", "serviceAccount:another-sa@my-project.iam.gserviceaccount.com"]`. | Yes      |         |
| `iam_project_roles`   | list(string)                | A list of IAM roles to grant to the service account at the *project* level. These roles determine the permissions that the service account has within the project. Example: `["roles/viewer", "roles/compute.networkUser"]`.                     | Yes      |         |
