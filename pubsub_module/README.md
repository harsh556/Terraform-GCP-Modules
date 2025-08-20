## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.10.2 |
| [google](#requirement_google) | >= 6.21.0, < 7.0.0 |
| [google-beta](#requirement_google-beta) | >= 6.21.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [topic\_with\_schema](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/pubsub | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [pubsub](variables.tf#L1) | Map of Pub/Sub topic configurations.  This map allows you to define multiple Pub/Sub topics with schemas, subscriptions, IAM policies, and other configurations. | <pre>map(object({<br/>    project_id   = string<br/>    topic_name   = string<br/>    kms_key_name = optional(string)<br/>    labels       = optional(map(string), {})<br/>    iam          = optional(map(list(string)))<br/>    iam_bindings_additive = optional(map(object({<br/>      member = string<br/>      role   = string<br/>      condition = optional(object({<br/>        expression  = string<br/>        title       = string<br/>        description = optional(string)<br/>      }))<br/>    })))<br/>    message_retention_duration = optional(string) # Defaults to 1 day<br/>    schema = optional(object({<br/>      definition   = string<br/>      msg_encoding = optional(string)<br/>      schema_type  = string<br/>    }), null)<br/>    regions = optional(list(string), [])<br/>    subscriptions = optional(map(object({<br/>      ack_deadline_seconds         = optional(number)<br/>      enable_exactly_once_delivery = optional(bool, false)<br/>      enable_message_ordering      = optional(bool, false)<br/>      expiration_policy_ttl        = optional(string)<br/>      filter                       = optional(string)<br/>      iam                          = optional(map(list(string)), {})<br/>      labels                       = optional(map(string))<br/>      message_retention_duration   = optional(string)<br/>      retain_acked_messages        = optional(bool, false)<br/>      bigquery = optional(object({<br/>        table                 = string<br/>        drop_unknown_fields   = optional(bool, false)<br/>        service_account_email = optional(string)<br/>        use_table_schema      = optional(bool, false)<br/>        use_topic_schema      = optional(bool, false}<br/>        write_metadata        = optional(bool, false)<br/>      }))<br/>      cloud_storage = optional(object({<br/>        bucket          = string<br/>        filename_prefix = optional(string)<br/>        filename_suffix = optional(string)<br/>        max_duration    = optional(string)<br/>        max_bytes       = optional(number)<br/>        avro_config = optional(object({<br/>          write_metadata = optional(bool, false)<br/>        }))<br/>      }))<br/>      dead_letter_policy = optional(object({<br/>        topic                 = string<br/>        max_delivery_attempts = optional(number)<br/>      }))<br/>      iam_bindings_additive = optional(map(object({<br/>        member = string<br/>        role   = string<br/>        condition = optional(object({<br/>          expression  = string<br/>          title       = string<br/>          description = optional(string)<br/>        }))<br/>      })), {})<br/>      push = optional(object({<br/>        endpoint   = string<br/>        attributes = optional(map(string))<br/>        no_wrapper = optional(bool, false)<br/>        oidc_token = optional(object({<br/>          audience              = optional(string)<br/>          service_account_email = string<br/>        }))<br/>      }))<br/>      retry_policy = optional(object({<br/>        minimum_backoff = optional(number)<br/>        maximum_backoff = optional(number)<br/>      }))<br/>    })), {})<br/>  }))</pre> | `{}` | no |

<a name="input_pubsub"></a>

### `pubsub` Details:

This input variable is a map where each key represents the name or identifier for a Pub/Sub topic you want to create. The value associated with each key is an object defining the topic's configuration.

#### Pub/Sub Topic Configuration Object:

| Attribute                  | Type                                   | Description                                                                                                                                                                                            | Required | Default           |
|----------------------------|----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------|
| `project_id`               | string                                 | The ID of the Google Cloud project where the Pub/Sub topic will be created.                                                                                                                            | Yes      |                   |
| `topic_name`               | string                                 | The name of the Pub/Sub topic. This must be unique within the project.                                                                                                                                 | Yes      |                   |
| `kms_key_name`             | optional(string)                       | The KMS key name used for encryption of messages published to this topic. If not provided, Google manages the encryption.                                                                             | No       | `null`            |
| `labels`                   | optional(map(string))                  | A map of labels to apply to the Pub/Sub topic.                                                                                                                                                          | No       | `{}`              |
| `iam`                      | optional(map(list(string)))             | A map defining IAM policies for the topic. The keys are IAM roles, and the values are lists of members (e.g., `roles/pubsub.publisher = ["user:test@example.com"]`).                                 | No       |                   |
| `iam_bindings_additive`  | optional(map(object(...)))            | A map of additive IAM bindings. Each key represents a unique binding, and the value is an object specifying the `member`, `role`, and optional `condition`. Use this to grant conditional access. | No       |                   |
| `message_retention_duration`| optional(string)                     | The duration for which messages are retained in the topic.  Examples: `"7d"` (7 days), `"1h"` (1 hour). Defaults to 1 day if not set.                                                              | No       | `"1d"`              |
| `schema`                   | optional(object(...), null)             | Configuration for the schema associated with the topic.  If `null`, no schema is used. See details below.                                                                                         | No       | `null`            |
| `regions`                  | optional(list(string), [])            | A list of regions for the topic, used when global access is disabled. If not provided it will be a global topic                                                                                         | No       | `[]` |
| `subscriptions`            | optional(map(object(...))), {})         | A map defining subscriptions to the topic.  Each key is the subscription name, and the value is a configuration object. See details below.                                                            | No       | `{}`              |

#### Schema Configuration Object:

| Attribute      | Type     | Description                                                                                                                                                              | Required | Default |
|----------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `definition`   | string   | The definition of the schema. This is typically a string containing the Avro, Protocol Buffer, or text schema definition.                                                  | Yes      |         |
| `msg_encoding` | optional(string) | The encoding of messages validated against the schema. Options: `JSON`, `BINARY`, or leave empty for unspecified and default to schema type.                   | No      |      |
| `schema_type`  | string   | The type of schema.  Valid values are `"AVRO"`, `"PROTOCOL_BUFFER"`, and `"TEXT"`.                                                                                         | Yes      |         |

#### Subscription Configuration Object:

| Attribute                           | Type                                   | Description                                                                                                                                                          | Required | Default     |
|-------------------------------------|----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------|
| `ack_deadline_seconds`              | optional(number)                       | The maximum time (in seconds) after a subscriber receives a message before the subscriber must acknowledge the message. Defaults to 10.                           | No       | `10`        |
| `enable_exactly_once_delivery`      | optional(bool, false)                 | Whether to enable exactly once delivery. This ensures that each message is delivered to the subscriber exactly once. Defaults to `false`.                          | No       | `false`     |
| `enable_message_ordering`           | optional(bool, false)                 | Whether to enable message ordering.  Messages are delivered in the order they are published. Defaults to `false`.                                                    | No       | `false`     |
| `expiration_policy_ttl`             | optional(string)                       | A duration representing the lifetime of the subscription. After this duration, the subscription is automatically deleted. Example: `"30d"` (30 days).                                            | No       | `null`        |
| `filter`                            | optional(string)                       | A filter expression that filters messages published to the topic before they are delivered to the subscription.                                                           | No       | `""`          |
| `iam`                               | optional(map(list(string)), {})       | A map defining IAM policies for the subscription, similar to the topic's `iam` attribute.                                                                        | No       | `{}`          |
| `labels`                            | optional(map(string))                  | A map of labels to apply to the subscription.                                                                                                                        | No       | `null`        |
| `message_retention_duration`          | optional(string)                 | The maximum duration for which messages are retained in the subscription.  Defaults to the topic's retention duration. Example: `"7d"` (7 days)                       | No       |      |
| `retain_acked_messages`             | optional(bool, false)                 | Whether to retain acknowledged messages. Defaults to `false`.                                                                                                     | No       | `false`     |
| `bigquery`                         | optional(object(...))                 | Configuration for exporting messages to BigQuery.  See details below. If `null`, no BigQuery export is configured.                                                  | No       | `null`        |
| `cloud_storage`                         | optional(object(...))                 | Configuration for exporting messages to Cloud Storage.  See details below. If `null`, no Cloud Storage export is configured.                                                  | No       | `null`        |
| `dead_letter_policy`| optional(object(...)) | Configuration for the dead letter policy. See details below. If `null`, no dead letter policy is configured.                                                                         | No       | `null`|
| `iam_bindings_additive`            | optional(map(object(...)), {})         | Additive IAM Bindings for the subscription.                                                                                 | No       | `{}`|
| `push`                            | optional(object(...))                 | Configuration for push delivery to an endpoint.  See details below. If `null`, no push delivery is configured (pull delivery is used).                               | No       | `null`        |
| `retry_policy`                            | optional(object(...))                 | Configuration for retry policy.  See details below. If `null`, default retry policy is used.                               | No       | `null`        |

#### BigQuery Configuration Object:

| Attribute              | Type                | Description                                                                                                                                                                                                                  | Required | Default |
|------------------------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `table`                | string              | The fully qualified name of the BigQuery table to write to (e.g., `"your-project.your_dataset.your_table"`).                                                                                                               | Yes      |         |
| `drop_unknown_fields`  | optional(bool, false) | Whether to drop unknown fields from the message when writing to BigQuery. Defaults to `false`.                                                                                                                               | No       | `false` |
| `service_account_email`| optional(string)    | The service account email to use for writing to BigQuery. If not provided, the default compute engine service account is used.                                                                                                 | No       |         |
| `use_table_schema`     | optional(bool, false) | Whether to use the BigQuery table's schema for writing messages. If `false`, the topic's schema is used.  Defaults to `false`.                                                                                             | No       | `false` |
| `use_topic_schema`     | optional(bool, false) | Whether to use the topic schema to validate messages being written to BigQuery. This value is superceded by the `use_table_schema` and should only be used if `use_table_schema` is false. Defaults to `false`.      | No       | `false` |
| `write_metadata`        | optional(bool, false) | Whether to write Pub/Sub metadata to BigQuery. The metadata fields will be populated in the BigQuery table. Defaults to `false`. | No       | `false` |

#### Cloud Storage Configuration Object:

| Attribute       | Type                | Description                                                                                                                                                                          | Required | Default |
|-----------------|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `bucket`        | string              | The name of the Cloud Storage bucket to write to (e.g., `"your-bucket-name"`).                                                                                                      | Yes      |         |
| `filename_prefix`| optional(string)    | A prefix to add to the filename of each object written to Cloud Storage.                                                                                                          | No       |         |
| `filename_suffix`| optional(string)    | A suffix to add to the filename of each object written to Cloud Storage.                                                                                                          | No       |         |
| `max_duration`  | optional(string)    | The maximum duration for which data is buffered before being written to Cloud Storage.  Example: `"300s"` (300 seconds).                                                             | No       |         |
| `max_bytes`     | optional(number)    | The maximum number of bytes to buffer before writing to Cloud Storage.                                                                                                              | No       |         |
| `avro_config`   | optional(object(...)) | Configuration for Avro output format. If this field is set, output files shall be written in the Avro format | No      |         |

#### Avro Configuration Object:

| Attribute          | Type           | Description                                                                                                                                 | Required | Default |
|--------------------|----------------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `write_metadata`   | optional(bool) | When true, writes the Pub/Sub message metadata to storage. The message metadata includes the delivery attempt count, ordering key, message ID, publish time, and attributes. | No       | `false` |

#### Dead Letter Policy Configuration Object:
| Attribute              | Type    | Description                                                                                                                                                                                                                   | Required | Default |
|------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `topic`                  | string  | The name of the topic to which dead letter messages are forwarded. Must be of the format `projects/{project}/topics/{topic}`.                                                                                                  | Yes      |         |
| `max_delivery_attempts`| number  | The maximum number of delivery attempts for a message before it is sent to the dead letter topic.  Must be greater than zero.                                                                                                | Yes      |         |

#### Push Configuration Object:

| Attribute             | Type                | Description                                                                                                                                                 | Required | Default     |
|-----------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------|
| `endpoint`            | string              | The URL endpoint to which messages are pushed (e.g., `"https://your-service.example.com/messages"`).  Must be an HTTPS endpoint.                             | Yes      |             |
| `attributes`          | optional(map(string)) | A map of attributes to include in the push request headers.                                                                                                   | No       |             |
| `no_wrapper`          | optional(bool, false) | When true, writes the Pub/Sub message payload directly to HTTP request body.  When false, the Pub/Sub message is included as a JSON payload within the HTTP request.   Defaults to `false`.           | No       | `false`        |
| `oidc_token`          | optional(object(...)) | Configuration for OIDC token authentication. See details below.                                                                                               | No       | `null`        |

#### OIDC Token Configuration Object:

| Attribute              | Type     | Description                                                                                                                               | Required | Default |
|------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `audience`             | optional(string) | The audience to be used when generating OIDC token. The audience must be provided if service account tokens are enabled. | No       |         |
| `service_account_email`| string   | The service account email to use for generating the OIDC token.                                                                         | Yes      |         |

#### Retry Policy Configuration Object:

| Attribute           | Type     | Description                                                                                                                               | Required | Default |
|---------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `minimum_backoff`| optional(number) | The minimum delay between message delivery retries (in seconds). Must be between 10 and 600. If both minimum and maximum backoff are not specified, default values are 10 and 600 respectively.                                                                                 | No      |         |
| `maximum_backoff`             | optional(number) | The maximum delay between message delivery retries (in seconds). Must be between 10 and 600. If both minimum and maximum backoff are not specified, default values are 10 and 600 respectively.       | No       | |
