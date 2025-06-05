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
| [folders](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/folder | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [folders](variable.tf#L1) | Map of folders to be created, with their display names and parent folders/organizations. | <pre>map(object({<br/>    folder_name = string<br/>    parent_id   = string<br/>  }))</pre> | `null` | yes |

<a name="input_folders"></a>

### `folders` Details:

This input variable is a map where each key represents the identifier for a folder you want to create. The value associated with each key is an object defining the folder's configuration.

#### Folder Configuration Object:

| Attribute     | Type   | Description                                                                                                                                                                | Required | Default |
|---------------|--------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `folder_name` | string | The display name of the folder. This name will be visible in the Google Cloud Console.  It does not need to be unique across the entire organization, but should be descriptive. | Yes      |         |
| `parent_id`   | string | The ID of the parent folder or organization under which the new folder will be created.  This can be the ID of an organization (e.g., `"organizations/123456789"`) or another folder (e.g., `"folders/987654321"`). | Yes      |         |

