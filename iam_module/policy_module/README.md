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
| [policy](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [policy\_by\_principal](#input_policy_by_principal) | A map defining IAM policies for a Google Cloud project, organized by principal (user, service account, etc.). This input enables you to grant multiple roles to different principals within a project. | <pre>map(object({<br/>    project_id = string<br/>    principal  = string<br/>    roles      = list(string)<br/>  }))</pre> | `null` | yes |

<a name="input_policy_by_principal"></a>

### `policy_by_principal` Details:

This input variable is a map where each key represents a unique identifier for a set of IAM bindings for a specific principal. The value associated with each key is an object defining the project ID, the principal, and the list of roles to grant to that principal.

#### Policy by Principal Configuration Object:

| Attribute   | Type     | Description                                                                                                                                                                      | Required | Default |
|-------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`| string   | The ID of the Google Cloud project where the IAM policy will be applied. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                  | Yes      |         |
| `principal` | string   | The principal to grant the roles to. This can be a user, a service account, a group, or a domain. Examples: `"user:test@example.com"`, `"serviceAccount:my-sa@my-project.iam.gserviceaccount.com"`, `"group:my-group@example.com"`, `"domain:example.com"`. | Yes      |         |
| `roles`     | list(string) | A list of IAM roles to grant to the principal on the project. Example: `["roles/viewer", "roles/compute.networkUser"]`.                                                             | Yes      |         |
