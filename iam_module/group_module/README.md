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
| [group](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloud-identity-group | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [Groups](#input_Groups) | A map defining Cloud Identity group configurations. This input allows you to create and manage multiple Google Cloud Identity groups, including setting their names, descriptions, members, and managers. | <pre>map(object({<br/>    group_email = string<br/>    group_name  = string<br/>    customer_id = string<br/>    description = string<br/>    members     = list(string)<br/>    managers    = list(string)<br/>  }))</pre> | `null` | yes |

<a name="input_Groups"></a>

### `Groups` Details:

This input variable is a map where each key represents a unique identifier for a Cloud Identity group. The value associated with each key is an object defining the group's configuration.

#### Cloud Identity Group Configuration Object:

| Attribute    | Type     | Description                                                                                                                                                                                                                | Required | Default |
|--------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `group_email`| string   | The email address of the group. This must be a valid email address within your Cloud Identity domain. Example: `"my-group@example.com"`.                                                                               | Yes      |         |
| `group_name` | string   | The display name of the group. This is a human-readable name that is shown in the Google Cloud Console and other applications. Example: `"My Team Group"`.                                                                 | Yes      |         |
| `customer_id`| string   | The unique ID for your Google Workspace customer. This ID is used to associate the group with your organization. You can find your customer ID in the Google Admin console.  It typically starts with "C" followed by several numbers. Example: `"C123456789"`. | Yes      |         |
| `description`| string   | A description of the group. This description is shown in the Google Cloud Console and other applications. Example: `"A group for managing access to our production environment."`.                                           | Yes      |         |
| `members`    | list(string) | A list of email addresses of the users or groups who should be members of this group. Examples: `["user1@example.com", "group2@example.com"]`.                                                                          | Yes      |         |
| `managers`   | list(string) | A list of email addresses of the users or groups who should be managers of this group. Managers can manage the group's membership and settings. Examples: `["user3@example.com", "group4@example.com"]`.                                                  | Yes      |         |
