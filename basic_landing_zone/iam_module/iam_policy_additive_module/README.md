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
| [additive\_policy](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [additive\_policy](variable.tf#L1) | Configuration for applying additive IAM policies to projects. This allows you to grant roles to members in addition to any existing IAM policies. | <pre>map(object({<br/>    project_id = string<br/>    iam_bindings_additive = map(object({<br/>      member = string<br/>      role   = string<br/>    }))<br/>  }))</pre> | `null` | yes |

<a name="input_additive_policy"></a>

### `additive_policy` Details:

This input variable is a map where each key represents the identifier for a project to which you want to apply additive IAM policies.  The value associated with each key is an object defining the additive IAM bindings.

#### Additive Policy Configuration Object:

| Attribute             | Type   | Description                                                                                                                                            | Required | Default |
|-----------------------|--------|--------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`          | string | The ID of the Google Cloud project to which the additive IAM policy will be applied.                                                                  | Yes      |         |
| `iam_bindings_additive` | map    | A map defining the IAM bindings to add to the project.  Each key in this map represents an identifier for the binding. | Yes      |         |

#### IAM Binding Configuration Object:

| Attribute | Type   | Description                                                                                                            | Required | Default |
|-----------|--------|------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `member`  | string | The IAM member to grant the role to. Use the fully qualified member identifier (e.g., `"user:test@example.com"`, `"group:admins@example.com"`, `"serviceAccount:my-sa@project.iam.gserviceaccount.com"`). | Yes      |         |
| `role`    | string | The IAM role to grant to the member (e.g., `"roles/viewer"`, `"roles/editor"`, `"roles/compute.instanceAdmin"`).                       | Yes      |         |