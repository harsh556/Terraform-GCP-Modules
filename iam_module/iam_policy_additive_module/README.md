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
| [additive\_policy](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/project | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [additive\_policy](#input_additive_policy) | A map defining additive IAM policy bindings for a Google Cloud project.  This input enables you to grant multiple roles to different members (users, service accounts, etc.) within a project *without* overwriting existing IAM policies. Use this for incremental permission changes. | <pre>map(object({<br/>    project_id = string<br/>    iam_bindings_additive = map(object({<br/>      member = string<br/>      role   = string<br/>    }))<br/>  }))</pre> | `null` | yes |

<a name="input_additive_policy"></a>

### `additive_policy` Details:

This input variable is a map where each key represents a unique identifier for a set of *additive* IAM bindings. The value associated with each key is an object defining the project ID and the IAM bindings to add.

#### Additive Policy Configuration Object:

| Attribute        | Type     | Description                                                                                                                                                                                                                  | Required | Default |
|------------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`     | string   | The ID of the Google Cloud project where the IAM policy will be applied. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                                         | Yes      |         |
| `iam_bindings_additive` | map(object(...)) | A map defining the IAM bindings to *add* to the project's existing IAM policy. Each key is a unique identifier for the binding, and the value is an object specifying the `member` and `role`. See "IAM Binding Object" below for details. | Yes      |         |

#### IAM Binding Object:

| Attribute  | Type   | Description                                                                                                                                                                       | Required | Default |
|------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `member`   | string | The member (user, service account, group, or domain) to grant the role to. Examples: `"user:test@example.com"`, `"serviceAccount:my-sa@my-project.iam.gserviceaccount.com"`, `"group:my-group@example.com"`, `"domain:example.com"`. | Yes      |         |
| `role`     | string | The IAM role to grant to the member. Example: `"roles/viewer"`, `"roles/compute.networkUser"`.                                                                                     | Yes      |         |
