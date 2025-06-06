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
| [proj\_cust\_role](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [custom\_roles](variable.tf#L1) | Configuration for custom IAM roles to be created at the project level. | <pre>map(object({<br/>    project_id       = string<br/>    custom_role_name = string<br/>    role_permissions = list(string)<br/>    iam_principal    = list(string)<br/>  }))</pre> | `null` | yes |

<a name="input_custom_roles"></a>

### `custom_roles` Details:

This input variable is a map where each key represents the identifier for a custom role you want to create.  The value associated with each key is an object defining the custom role's configuration within a specific project.

#### Custom Role Configuration Object:

| Attribute         | Type          | Description                                                                                                                               | Required | Default |
|-------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`      | string        | The ID of the Google Cloud project where the custom role will be created.                                                               | Yes      |         |
| `custom_role_name`| string        | The name of the custom role. This name must be unique within the project.  It's typically a short, descriptive name (e.g., `"myCustomRole"`). | Yes      |         |
| `role_permissions`| list(string)  | A list of IAM permissions to assign to the custom role (e.g., `["compute.instances.get", "storage.buckets.list"]`).                         | Yes      |         |
| `iam_principal`   | list(string)  | A list of IAM principals (users, groups, service accounts) to grant the custom role to.  Use the fully qualified principal identifier (e.g., `["user:test@example.com", "group:admins@example.com"]`).| No       |         |

