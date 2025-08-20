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
| [proj\_cust\_role](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [custom\_roles](#input_custom_roles) | A map defining custom IAM roles at the project level. This input enables you to create and manage custom roles with specific permissions within a Google Cloud project, and then grant those roles to specified principals. | <pre>map(object({<br/>    project_id       = string<br/>    custom_role_name = string<br/>    role_permissions = list(string)<br/>    iam_principal    = list(string)<br/>  }))</pre> | `null` | yes |

<a name="input_custom_roles"></a>

### `custom_roles` Details:

This input variable is a map where each key represents a unique identifier for a custom IAM role. The value associated with each key is an object defining the project ID, the custom role name, the permissions to grant to the role, and the principals to grant the role to.

#### Custom Role Configuration Object:

| Attribute         | Type     | Description                                                                                                                                                                                       | Required | Default |
|-------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`      | string   | The ID of the Google Cloud project where the custom role will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                              | Yes      |         |
| `custom_role_name`| string   | The name of the custom role. This name must be unique within the project. Example: `"myCustomRole"`.                                                                                           | Yes      |         |
| `role_permissions`| list(string) | A list of IAM permissions to grant to the custom role. Permissions determine what actions the role is authorized to perform. Example: `["compute.instances.list", "storage.buckets.get"]`.                                   | Yes      |         |
| `iam_principal`   | list(string) | A list of principals (users, service accounts, groups, or domains) to whom the custom role should be granted.  Examples: `["user:test@example.com", "serviceAccount:my-sa@my-project.iam.gserviceaccount.com"]`.                  | Yes      |         |
