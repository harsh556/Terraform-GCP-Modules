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
| [group](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloud-identity-group | n/a |



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [Groups](variable.tf#L1) | Configuration for Cloud Identity Groups. | <pre>map(object({<br/>    group_email = string<br/>    group_name  = string<br/>    customer_id = string<br/>    description = string<br/>    members     = list(string)<br/>    managers    = list(string)<br/>  }))</pre> | `null` | yes |

<a name="input_Groups"></a>

### `Groups` Details:

This input variable is a map where each key represents the identifier for a Cloud Identity Group you want to create. The value associated with each key is an object defining the Cloud Identity Group's configuration.

#### Cloud Identity Group Configuration Object:

| Attribute     | Type          | Description                                                                                                                                                             | Required | Default |
|---------------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `group_email` | string        | The email address of the group. This must be a unique and available email address within your Cloud Identity domain (e.g., `"my-group@example.com"`).                  | Yes      |         |
| `group_name`  | string        | The display name of the group. This is the name that will be shown in the Google Cloud Console and other Google services (e.g., `"My Team Group"`).                      | Yes      |         |
| `customer_id` | string        | The ID of the Google Cloud Customer to which the group belongs.  This is your Cloud Identity or Google Workspace customer ID (e.g., `"C123abc45"`).                     | Yes      |         |
| `description` | string        | A description of the group's purpose.                                                                                                                                 | No       |         |
| `members`     | list(string)  | A list of email addresses of users who should be members of the group (e.g., `["user1@example.com", "user2@example.com"]`).                                             | No       |         |
| `managers`    | list(string)  | A list of email addresses of users who should be managers of the group (e.g., `["manager1@example.com", "manager2@example.com"]`). Managers have elevated privileges. | No       |         |

