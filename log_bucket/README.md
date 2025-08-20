## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.10.2 |
| [google](#requirement_google) | >= 6.13.0, < 7.0.0 |
| [google-beta](#requirement_google-beta) | >= 6.13.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [bucket](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/logging-bucket | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [logging\_bucket](variables.tf#L1) | A map of Cloud Logging bucket configurations. This input allows you to define multiple Cloud Logging buckets, which are used to store log data. | <pre>map(object({<br/>    parent_type          = string # (project, folder, organization, billing_account)<br/>    parent_id            = string # ('project_id' 'folders/folder_id', 'organizations/organization_id' or 'billing_account_id')<br/>    bucket_name          = string<br/>    enable_log_analytics = optional(bool, false)<br/>    dataset_link_id      = optional(string, null)<br/>  }))</pre> | n/a | yes |

<a name="input_logging_bucket"></a>

### `logging_bucket` Details:

This input variable is a map where each key represents a unique identifier for a Cloud Logging bucket. The value associated with each key is an object defining the bucket's configuration.

#### Cloud Logging Bucket Configuration Object:

| Attribute                  | Type     | Description                                                                                                                                                                       | Required | Default |
|----------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `parent_type`            | string   | The type of the parent resource to which the logging bucket belongs. Valid values are `"project"`, `"folder"`, `"organization"`, or `"billing_account"`. Example: `"project"`. | Yes      |         |
| `parent_id`              | string   | The ID of the parent resource.  This should correspond to the `parent_type`.  Examples: `"my-project-123"` (for a project), `"folders/1234567890"` (for a folder), `"organizations/1234567890"` (for an organization), or `"012345-67890A-BCDEF0"` (for a billing account).        | Yes      |         |
| `bucket_name`            | string   | The name of the Cloud Logging bucket. This name must be unique within the parent resource and conform to Google Cloud's bucket naming conventions. Example: `"my-logging-bucket"`. | Yes      |         |
| `enable_log_analytics`   | optional(bool, false) | Determines whether to enable Log Analytics for this bucket.  Log Analytics allows you to query and analyze your logs using SQL.                                                                   | No       | `false` |
| `dataset_link_id`        | optional(string, null) | When `enable_log_analytics` is set to true. This creates the link between the bucket and the dataset. This has the following format `[DATASET_ID]`. The link will be created in the same project/location as the bucket. Please note that the regional external logging bucket has restrictions, please check the documentation before setup it.                                          | No       | `null`    |
