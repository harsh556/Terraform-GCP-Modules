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
| [bucket](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/gcs | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [gcs\_config](variable.tf#L1) | Configuration for creating Google Cloud Storage buckets. | <pre>map(object({<br/>    project_id               = string<br/>    prefix                   = optional(string)<br/>    name                     = string<br/>    location                 = string<br/>    versioning               = bool<br/>    public_access_prevention = string<br/>    retention_policy = optional(object({<br/>      retention_period = number<br/>    }))<br/>    lifecycle_rules = optional(map(object({<br/>      action = object({<br/>        type          = string<br/>        storage_class = optional(string)<br/>      })<br/>      condition = object({<br/>        age                        = optional(number)<br/>        created_before             = optional(string)<br/>        custom_time_before         = optional(string)<br/>        days_since_custom_time     = optional(number)<br/>        days_since_noncurrent_time = optional(number)<br/>        matches_prefix             = optional(list(string))<br/>        matches_storage_class      = optional(list(string)) # STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE, DURABLE_REDUCED_AVAILABILITY<br/>        matches_suffix             = optional(list(string))<br/>        noncurrent_time_before     = optional(string)<br/>        num_newer_versions         = optional(number)<br/>        with_state                 = optional(string) # "LIVE", "ARCHIVED", "ANY"<br/>      })<br/>    })))<br/>    soft_delete_retention       = optional(number)<br/>    uniform_bucket_level_access = bool<br/>    labels                      = map(string)<br/>  }))</pre> | n/a | yes |

<a name="input_gcs_config"></a>

### `gcs_config` Details:

This input variable is a map where each key represents an identifier for a Google Cloud Storage bucket you want to create. The value associated with each key is an object defining the bucket's configuration.

#### GCS Bucket Configuration Object:

| Attribute                     | Type                         | Description                                                                                                                                                         | Required | Default |
| ----------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `project_id`                  | string                       | The ID of the Google Cloud project where the bucket will be created.                                                                                             | Yes      |         |
| `prefix`                      | optional(string)             | A prefix to add to the bucket name.                                                                                                                                 | No       |         |
| `name`                        | string                       | The name of the bucket. Must be globally unique.                                                                                                                     | Yes      |         |
| `location`                    | string                       | The location where the bucket will be created (e.g., `"US"`, `"EU"`, `"asia-east1"`).                                                                                 | Yes      |         |
| `versioning`                  | bool                         | Whether object versioning is enabled for the bucket.                                                                                                                 | Yes      |         |
| `public_access_prevention`    | string                       | Prevents public access to the bucket. Valid values are `"inherited"` and `"enforced"`.                                                                           | Yes      |         |
| `retention_policy`            | optional(Retention Policy Object) | Configuration for a retention policy on the bucket.                                                                                                                  | No       |         |
| `lifecycle_rules`             | optional(map(Lifecycle Rule Object)) | A map of lifecycle rules for the bucket. The key of the map is a unique identifier for the rule. | No       |         |
| `soft_delete_retention` | optional(number) |  Set the length to the soft delete retention to protect bucket data from accidental deletion/overwrite (values are in days). If no value is set for retention_days on retention policy, the GCS bucket will operate in Legacy Bucket PolicyOnly Mode. The property cannot be changed to Standard Mode with retention_days set or the bucket can be destroyed when objects are present in it.   | No       |       |
| `uniform_bucket_level_access` | bool                         | Whether uniform bucket-level access is enabled for the bucket.                                                                                                       | Yes      |         |
| `labels`                      | map(string)                  | A map of labels to apply to the bucket.                                                                                                                               | Yes      |         |

#### Retention Policy Object:

| Attribute        | Type     | Description                                                                         | Required | Default |
|------------------|----------|-------------------------------------------------------------------------------------|----------|---------|
| `retention_period` | number | The duration, in seconds, that objects must be retained. | Yes      |         |

#### Lifecycle Rule Object:

| Attribute        | Type               | Description                                                                                                 | Required | Default |
|------------------|--------------------|-------------------------------------------------------------------------------------------------------------|----------|---------|
| `action`         | Action Object      | The action to take when the condition is met.                                                               | Yes      |         |
| `condition`      | Condition Object   | The condition that must be met for the action to be taken.                                                     | Yes      |         |

#### Action Object:

| Attribute        | Type     | Description                                                                                                                | Required | Default |
|------------------|----------|----------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `type`           | string   | The type of action to take. Valid values are `"Delete"` and `"SetStorageClass"`.                                         | Yes      |         |
| `storage_class`  | optional(string) | The storage class to set if the type is `"SetStorageClass"`. Valid values depend on the location of the bucket. | No       |         |

#### Condition Object:

| Attribute                     | Type                    | Description                                                                                                                                                                                                     | Required | Default |
|-------------------------------|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `age`                         | optional(number)          | The age of the object (in days) since it was created.                                                                                                                                                               | No       |         |
| `created_before`              | optional(string)          | A date in RFC 3339 format (e.g., `"2023-10-26"`) before which objects should be subject to the rule.                                                                                                              | No       |         |
| `custom_time_before`          | optional(string)          | A date in RFC 3339 format (e.g., `"2023-10-26"`) before which the object's custom time (set with the `"google_storage_object"` resource's `custom_time` attribute) should be.                              | No       |         |
| `days_since_custom_time`      | optional(number)          | The number of days elapsed since the object's custom time (set with the `"google_storage_object"` resource's `custom_time` attribute)                                                                        | No       |         |
| `days_since_noncurrent_time`  | optional(number)          | The number of days elapsed since the noncurrent timestamp of an object. This condition is relevant only for versioned objects.                                                                                | No       |         |
| `matches_prefix`              | optional(list(string))    | A list of prefixes that objects must match to be subject to the rule.                                                                                                                                       | No       |         |
| `matches_storage_class`       | optional(list(string))    | A list of storage classes that objects must match to be subject to the rule. Valid values are `"STANDARD"`, `"MULTI_REGIONAL"`, `"REGIONAL"`, `"NEARLINE"`, `"COLDLINE"`, `"ARCHIVE"`, and `"DURABLE_REDUCED_AVAILABILITY"`. | No       |         |
| `matches_suffix`              | optional(list(string))    | A list of suffixes that objects must match to be subject to the rule.                                                                                                                                       | No       |         |
| `noncurrent_time_before`      | optional(string)          | A date in RFC 3339 format (e.g., `"2023-10-26"`) before which the noncurrent timestamp of an object must be. This condition is relevant only for versioned objects.                                      | No       |         |
| `num_newer_versions`          | optional(number)          | Number of newer versions of an object to satisfy the condition, relevant only for versioned objects.                                                                                                        | No       |         |
| `with_state`                  | optional(string)          | Match to live and/or archived objects. Valid values: `"LIVE"`, `"ARCHIVED"`, `"ANY"`.                                                                                                                     | No       |         |

