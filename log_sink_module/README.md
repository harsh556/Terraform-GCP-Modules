## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.0.0 |
| [google](#requirement_google) | >= 5.27.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [log\_sink](main.tf#L1) | github.com/terraform-google-modules/terraform-google-log-export | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [sink](variables.tf#L1) | A map of log sinks to create.  This input allows you to define multiple log sinks, which export Google Cloud logs to various destinations (e.g., Cloud Storage, BigQuery, Pub/Sub). | <pre>map(object({<br/>    parent_resource_type   = string<br/>    parent_resource_id     = string<br/>    log_sink_name          = string<br/>    destination_uri        = string<br/>    filter                 = optional(string)<br/>    description            = optional(string, null)<br/>    intercept_children     = optional(bool, false)<br/>    include_children       = optional(bool, true)<br/>    unique_writer_identity = optional(bool, true)<br/>  }))</pre> | n/a | yes |

<a name="input_sink"></a>

### `sink` Details:

This input variable is a map where each key represents a unique identifier for a log sink. The value associated with each key is an object defining the log sink's configuration.

#### Log Sink Configuration Object:

| Attribute                  | Type     | Description                                                                                                                                                                                                                                                                                                                | Required | Default |
|----------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `parent_resource_type`   | string   | The type of the parent resource to which the log sink applies. Valid values are `"project"`, `"folder"`, or `"organization"`. Example: `"project"`.                                                                                                                                                                     | Yes      |         |
| `parent_resource_id`     | string   | The ID of the parent resource to which the log sink applies. This should correspond to the `parent_resource_type`. Example: `"my-project-123"` (for a project), `"1234567890"` (for a folder or organization).                                                                                                | Yes      |         |
| `log_sink_name`          | string   | The name of the log sink. This name must be unique within the parent resource. Example: `"my-log-sink"`.                                                                                                                                                                                                                 | Yes      |         |
| `destination_uri`        | string   | The destination to which logs will be exported. This must be a URI conforming to the Logging service's destination URI format. Examples: `"storage.googleapis.com/my-bucket"` (for Cloud Storage), `"bigquery.googleapis.com/projects/my-project/datasets/my-dataset"` (for BigQuery), `"pubsub.googleapis.com/projects/my-project/topics/my-topic"` (for Pub/Sub). | Yes      |         |
| `filter`                 | optional(string) | A filter expression that restricts the logs to be exported. See the Logging documentation for the filter syntax. Example: `"resource.type=gce_instance AND severity>=WARNING"`.                                                                                                                                               | No       |         |
| `description`            | optional(string, null) | A text description of the log sink.                                                                                                                                                                                                                                                                        | No       | `null`    |
| `intercept_children`     | optional(bool, false) | If set to `true`, the sink will intercept logs from child resources of the parent resource. This is useful for exporting logs from all projects within a folder or organization.                                                                                                                                | No       | `false`   |
| `include_children`       | optional(bool, true)  | If set to `true`, the sink will include logs from child resources of the parent resource. This is similar to `intercept_children`, but applies at the log entry level rather than the sink level.  It's generally recommended to leave this set to `true`.                                                             | No       | `true`    |
| `unique_writer_identity = optional(bool, true)` |  Whether or not to force a unique identity to be generated and used for this sink. The default behavior is true, unless the destination_uri is a storage bucket or topic with a user managed KMS key, in which case it will be false. Setting this to false without meeting those requirements will error. This field is used mainly to avoid conflicts when creating multiple sinks to the same destination.   | No     |  `true`      |
