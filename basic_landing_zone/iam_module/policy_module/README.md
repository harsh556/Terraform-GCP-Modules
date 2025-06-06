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
| [policy](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [policy\_by\_principal](variable.tf#L1) | Configuration for setting IAM policies on projects, grouped by IAM principal. This allows you to grant multiple roles to a single user, group, or service account on a specific project. | <pre>map(object({<br/>    project_id = string<br/>    principal  = string<br/>    roles      = list(string)<br/>  }))</pre> | `null` | no |

<a name="input_policy_by_principal"></a>

### `policy_by_principal` Details:

This input variable is a map where each key represents an identifier for a specific project and IAM principal combination. The value associated with each key is an object defining the roles to be granted to that principal on that project.

#### Policy Configuration Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `project_id` | string | The ID of the Google Cloud project to which the IAM policy will be applied. | Yes | |
| `principal` | string | The IAM principal to grant the roles to. Use the fully qualified principal identifier (e.g., `"user:test@example.com"`, `"group:admins@example.com"`, `"serviceAccount:my-sa@project.iam.gserviceaccount.com"`). | Yes | |
| `roles` | list(string) | A list of IAM roles to grant to the principal on the project (e.g., `["roles/viewer", "roles/editor", "roles/compute.instanceAdmin"]`). | Yes | |

