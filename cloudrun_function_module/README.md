## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.7.4 |
| [google](#requirement_google) | >= 6.21.0, < 7.0.0 |
| [google-beta](#requirement_google-beta) | >= 6.21.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [cloud\_function](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloud-function-v2 | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [cloud\_function\_config](variables.tf#L1) | A map of Cloud Function configurations | <pre>map(object({<br/>    name                   = string<br/>    prefix                 = optional(string)<br/>    description            = optional(string)<br/>    bucket                 = optional(string)<br/>    project_id             = string<br/>    region                 = optional(string)<br/>    iam                    = optional(map(list(string)))<br/>    ingress_settings       = optional(string)<br/>    service_account_create = optional(bool, false)<br/>    service_account        = optional(string) # if you are giving manual SA<br/>    secrets = optional(map(object({<br/>      is_volume  = bool<br/>      project_id = string<br/>      secret     = string<br/>      versions   = list(string)<br/>    })), null)<br/>    bucket_config = optional(object({<br/>      force_destroy             = optional(bool, true)<br/>      lifecycle_delete_age_days = optional(number, 7)<br/>      location                  = optional(string)<br/>    }), null)<br/>    function_config = object({<br/>      entry_point     = optional(string, "main")<br/>      instance_count  = optional(number, 1)<br/>      memory_mb       = optional(number, 256) # Memory in MB<br/>      cpu             = optional(string, "0.166")<br/>      runtime         = optional(string, "python310")<br/>      timeout_seconds = optional(number, 180)<br/>    })<br/>    bundle_config = object({<br/>      path = string<br/>      folder_options = optional(object({<br/>        archive_path = optional(string)<br/>        excludes     = optional(list(string))<br/>      }), null)<br/>    })<br/>    trigger_config = optional(object({<br/>      trigger_region = optional(string)<br/>      event_type     = string<br/>      #   event_type     = optional(string, "google.cloud.pubsub.topic.v1.messagePublished")<br/>      pubsub_topic          = optional(string)<br/>      service_account_email = optional(string)<br/>      retry_policy          = optional(string)<br/><br/>      event_filters = list(object({<br/>        attribute = string<br/>        value     = string<br/>      }))<br/>    }), null)<br/>    labels = map(string)<br/><br/>    vpc_connector = optional(object({<br/>      name            = string<br/>      egress_settings = string<br/>      create          = bool<br/>    }), null)<br/><br/>    vpc_connector_config = optional(object({<br/>      ip_cidr_range = string<br/>      network       = string<br/>      instances = optional(object({<br/>        max = optional(number)<br/>        min = optional(number, 2)<br/>      }))<br/>      throughput = optional(object({<br/>        max = optional(number, 300)<br/>        min = optional(number, 200)<br/>      }))<br/>    }), null)<br/>  }))</pre> | n/a | yes |
| [enable\_cloud\_function\_creation](#input_enable_cloud_function_creation) | enable cloud-function creation | `bool` | `true` | no |

<a name="input_cloud_function_config"></a>

### `cloud_function_config` Details:

This input variable is a map where each key represents an identifier for a Cloud Function you want to create. The value associated with each key is an object defining the Cloud Function's configuration.

#### Cloud Function Configuration Object:

| Attribute              | Type                          | Description                                                                                                                                                                                    | Required | Default       |
| ---------------------- | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------- |
| `name`                 | string                        | The name of the Cloud Function. Must be unique within the project and region.                                                                                                                 | Yes      |               |
| `prefix`               | optional(string)              | A prefix to add to the Cloud Function name.                                                                                                                                                  | No       |               |
| `description`            | optional(string)              | A description of the Cloud Function.                                                                                                                                                   | No       |               |
| `bucket`                 | optional(string)              | The name of the Google Cloud Storage bucket where the function's source code will be stored.  If not provided, a bucket will be created.                                              | No       |               |
| `project_id`           | string                        | The ID of the Google Cloud project where the Cloud Function will be created.                                                                                                                  | Yes      |               |
| `region`               | optional(string)              | The region where the Cloud Function will be deployed (e.g., `"us-central1"`).  If not specified, the default region for the provider is used.                                         | No       |               |
| `iam`                    | optional(map(list(string)))  | A map defining IAM bindings for the Cloud Function. The key of the map is the IAM role, and the value is a list of members to grant that role.                                          | No       |               |
| `ingress_settings`       | optional(string)              | The ingress settings for the function. Valid values are `"ALLOW_ALL"`, `"ALLOW_INTERNAL_ONLY"`, and `"ALLOW_INTERNAL_AND_LB"`.                                                           | No       |               |
| `service_account_create` | optional(bool)              | If set to `true`, a service account will be created for the Cloud Function. Default: `false`.                                                                                              | No       | `false`         |
| `service_account`      | optional(string)                | The email address of the service account to use for the function.  If `service_account_create` is `true`, this field is ignored.                                                                     | No       |               |
| `secrets`              | optional(map(Secret Object))   | A map defining secrets to be mounted as environment variables or volumes.   The key of the map is environment variable. | No       |   `null`          |
| `bucket_config`           | optional(Bucket Config Object) | Configuration for the bucket where source code will be stored,   If not null, source code will be store in new/use custom bucket  | No    | `null`          |
| `function_config`        | Function Config Object       | Configuration for the function's runtime environment.                                                                                                                                | Yes      |               |
| `bundle_config`      | Bundle Config Object         | Configuration for uploading the source code.                                                                                                | Yes      |               |
| `trigger_config`         | optional(Trigger Config Object)  | Configuration for the event trigger. If specified, the function will be triggered by events.  If not specified, the function will be an HTTP-triggered function.                | No       |   `null`          |
| `labels`               | map(string)                  | A map of labels to apply to the Cloud Function.                                                                                                                                         | Yes      |               |
| `vpc_connector` | optional(VPC Connector Object)     | Configuration for connecting the Cloud Function to a VPC network. If specified, the function will be able to access resources in the VPC. | No   | `null`           |
| `vpc_connector_config` | optional(VPC Connector Config Object)     | Configuration for vpc connector resources settings which used to create vpc connector resouce  | No   | `null`          |

#### Secret Object:

| Attribute    | Type    | Description                                                                             | Required | Default |
|------------|---------|-----------------------------------------------------------------------------------------|----------|---------|
| `is_volume`  | bool | Whether the secret should be mounted as a volume.  If set to `true`, the secret will be mounted as a volume in the function's file system.      | Yes      |         |
| `project_id` | string  | The ID of the Google Cloud project where the secret is stored.        | Yes      | |
| `secret` | string | The name of the secret to mount.        | Yes      | |
| `versions` | list(string) | The version of secret value to mount.        | Yes      | |

#### Bucket Config Object:

| Attribute              | Type       | Description                                                                             | Required | Default |
| ---------------------- | ---------- | --------------------------------------------------------------------------------------- | -------- | ------- |
| `force_destroy`     | optional(bool) |  Whether to force the destroy bucket when the object changes,Default is `true` .  | No | `true`    |
| `lifecycle_delete_age_days`| optional(number) |  Set the number of days to retain non current object versions.   | No | `7`       |
| `location`        | optional(string) | The location where the storage bucket will be created (e.g., `"US"`).             | No       |         |

#### Function Config Object:

| Attribute        | Type          | Description                                                                                                  | Required | Default     |
|------------------|---------------|--------------------------------------------------------------------------------------------------------------|----------|-------------|
| `entry_point`     | optional(string) | The name of the function entry point (the function to be executed when the function is triggered). Default: `"main"`.   | No       | `"main"`      |
| `instance_count`  | optional(number) | The number of instances to allocate for the function. Default: `1`.                                                                 | No       | `1`           |
| `memory_mb`       | optional(number) | The amount of memory to allocate for the function, in MB. Default: `256`.                               | No       | `256`         |
| `cpu` | optional(string) |  Amount of CPU to allocate to the cloud function.  Defaults to `0.166`.  | No | `0.166`           |
| `runtime`         | optional(string) | The runtime to use for the function (e.g., `"python310"`). Default: `"python310"`.                                                              | No       | `"python310"` |
| `timeout_seconds` | optional(number) | The maximum execution time for the function, in seconds. Default: `180`.                             | No       | `180`         |

#### Bundle Config Object:

| Attribute | Type   | Description                                                                                       | Required | Default |
| --------- | ------ | ------------------------------------------------------------------------------------------------- | -------- | ------- |
| `path`    | string | The path to the directory containing the function's source code.                                 | Yes      |         |
| `folder_options` | optional(Folder Options Object)  | Configuration to options for uploading a folder from source to the function.   if `path` is single file, use folder_options to specify a folder where files will reside on function | No       |  `null`       |

#### Folder Options Object:

| Attribute        | Type     | Description                                                              | Required | Default |
|------------------|----------|--------------------------------------------------------------------------|----------|---------|
| `archive_path`   | optional(string) | Path to archive after uploading folder contents, file need to be there before creating function.   | No       |      |
| `excludes`  | optional(list(string)) | List of glob patterns to exclude from being copied  | No       |   |

#### Trigger Config Object:

| Attribute             | Type          | Description                                                                                                                              | Required | Default |
|-----------------------|---------------|------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `trigger_region`      | optional(string) | The region of the event trigger.                                                                                                       | No       |         |
| `event_type`          | string   | The type of event to trigger the function (e.g., `"google.cloud.pubsub.topic.v1.messagePublished"`). | Yes       |         |
| `pubsub_topic`        | optional(string) | The Pub/Sub topic to trigger the function.  Required if `event_type` is a Pub/Sub event.          | No       |         |
| `service_account_email` | optional(string) | The service account email to use for the trigger.                                        | No       |         |
| `retry_policy`          | optional(string)   | The retry policy for the function.  Valid values are `"RETRY_POLICY_ALWAYS"` and `"RETRY_POLICY_NEVER"`.  Defaults to `"RETRY_POLICY_NEVER"`.                 | No       |         |
| `event_filters`         | list(Event Filter Object) | A list of event filters to apply to the trigger.                                                                          | Yes      |         |

#### Event Filter Object:

| Attribute | Type   | Description                                                                     | Required | Default |
| --------- | ------ | ------------------------------------------------------------------------------- | -------- | ------- |
| `attribute` | string | The attribute to filter on (e.g., `"bucket"` for a Cloud Storage trigger). | Yes      |         |
| `value`     | string | The value to match for the attribute (e.g., the bucket name).                 | Yes      |         |

#### VPC Connector Object:

| Attribute        | Type     | Description                                                                                                | Required | Default |
|------------------|----------|------------------------------------------------------------------------------------------------------------|----------|---------|
| `name`           | string | The name of the VPC connector.  If `create` is `true`, this name will be used as a prefix for the new connector. | Yes      |         |
| `egress_settings` | string | The egress settings for the connector. Valid values are `ALL_TRAFFIC` and `PRIVATE_RANGES_ONLY`.                                                       | Yes      |         |
| `create`        | bool   | Whether to create new vpc connector if it does not exits. Valid values `true`, `false`.   | Yes    |         |

#### VPC Connector Config Object:

| Attribute        | Type   | Description | Required | Default |
|------------------|----------|------------------------------------------------------------------------------------------------------------|----------|---------|
| `ip_cidr_range`   | string |  Range of internal addresses that follows RFC1918. Example: '10.0.0.0/28'.  | Yes    |         |
| `network`        | string |  The subnet to connect to. Either the subnet or network field has to be specified. | Yes    |         |
|  `instances`   | optional(VPC Instance Object) |  Set instances config for vpc connector resources, requires setting also attribute network | No   |    |
|  `throughput` | optional(VPC Throughput Object) |   Set max and min limit for throughtput connector recource  | No  |         |

#### VPC Instance Object:

| Attribute     | Type             | Description                                                                                                                                                             | Required | Default |
|---------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
|   `max`  | optional(number) |  Maximum number of virtual machine instances of the vpc connector resources if not set default value is use  | No      |         |
|   `min` | optional(number) |  Minimum number of virtual machine instances of the vpc connector resources if not set default value is use  | No      |    2     |

#### VPC Throughput Object:

| Attribute     | Type             | Description                                                                                                                                                             | Required | Default |
|---------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
|   `max`  | optional(number) |  Maximum value of the connector's throughput if not set default value is use  | No      |     300    |
|   `min` | optional(number) |  Minimum value of the connector's throughput if not set default value is use  | No      |     200    |

<a name="input_enable_cloud_function_creation"></a>

### `enable_cloud_function_creation` Details:

This input variable enables or disables the creation of Cloud Functions.

| Attribute  | Type   | Description                                                                       | Required | Default |
| ---------- | ------ | --------------------------------------------------------------------------------- | -------- | ------- |
| `enable_cloud_function_creation` | bool |  Enable or disable cloud-function creation | No | `true` |

