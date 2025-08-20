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
| [cloudsql\_instance](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloudsql-instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [cloudsql\_config](variable.tf#L1) | Configuration for Cloud SQL instances in a map format. | <pre>map(object({<br/>    # Required Variables<br/>    project_id        = string<br/>    region            = string<br/>    name              = string<br/>    database_version  = string<br/>    tier              = string<br/>    availability_type = string<br/><br/>    # Optional Variables<br/>    prefix                   = optional(string)<br/>    activation_policy        = optional(string, "ALWAYS")<br/>    backup_configuration = optional(object({<br/>      enabled                        = optional(bool, false)<br/>      binary_log_enabled             = optional(bool, false)<br/>      start_time                     = optional(string, "23:00")<br/>      location                       = optional(string)<br/>      log_retention_days             = optional(number, 7)<br/>      point_in_time_recovery_enabled = optional(bool)<br/>      retention_count                = optional(number, 7)<br/>    }), {})<br/>    collation                = optional(string)<br/>    connector_enforcement    = optional(string)<br/>    data_cache               = optional(bool, false)<br/>    databases                = optional(list(string))<br/>    disk_autoresize_limit    = optional(number, 0)<br/>    disk_size                = optional(number)<br/>    disk_type                = optional(string, "PD_SSD")<br/>    edition                  = optional(string, "ENTERPRISE")<br/>    encryption_key_name      = optional(string)<br/>    flags                    = optional(map(string))<br/>    gcp_deletion_protection  = optional(bool, true)<br/>    insights_config = optional(object({<br/>      query_string_length     = optional(number, 1024)<br/>      record_application_tags = optional(bool, false)<br/>      record_client_address   = optional(bool, false)<br/>      query_plans_per_minute  = optional(number, 5)<br/>    }))<br/>    labels = optional(map(string))<br/>    maintenance_config = optional(object({<br/>      maintenance_window = optional(object({<br/>        day          = number<br/>        hour         = number<br/>        update_track = optional(string)<br/>      }))<br/>      deny_maintenance_period = optional(object({<br/>        start_date = string<br/>        end_date   = string<br/>        start_time = optional(string, "00:00:00")<br/>      }))<br/>    }), {})<br/>    network_config = optional(object({<br/>      authorized_networks = optional(map(string))<br/>      connectivity = object({<br/>        public_ipv4 = optional(bool, false)<br/>        psa_config = optional(object({<br/>          private_network = string<br/>          allocated_ip_ranges = optional(object({<br/>            primary = optional(string)<br/>            replica = optional(string)<br/>          }))<br/>        }))<br/>        psc_allowed_consumer_projects    = optional(list(string))<br/>        enable_private_path_for_services = optional(bool, false)<br/>      })<br/>    }))<br/>    password_validation_policy = optional(object({<br/>      enabled = optional(bool, true)<br/>      change_interval             = optional(number)<br/>      default_complexity          = optional(bool)<br/>      disallow_username_substring = optional(bool)<br/>      min_length                  = optional(number)<br/>      reuse_interval              = optional(number)<br/>    }))<br/>    replicas = optional(map(object({<br/>      region              = string<br/>      encryption_key_name = optional(string)<br/>    })), {})<br/>    root_password = optional(object({<br/>      password        = optional(string)<br/>      random_password = optional(bool, false)<br/>    }), {})<br/>    ssl = optional(object({<br/>      client_certificates = optional(list(string))<br/>      mode = optional(string)<br/>    }), {})<br/>    terraform_deletion_protection = optional(bool, true)<br/>    time_zone                = optional(string)<br/>    users = optional(map(object({<br/>      password = optional(string)<br/>      type     = optional(string)<br/>    })))<br/>  }))</pre> | n/a | yes |

<a name="input_cloudsql_config"></a>

### `cloudsql_config` Details:

This input variable is a map where each key represents an identifier for a Cloud SQL instance you want to create. The value associated with each key is an object defining the Cloud SQL instance's configuration.

#### Cloud SQL Instance Configuration Object:

| Attribute                     | Type                         | Description                                                                                                                                                    | Required | Default           |
|-------------------------------|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------|
| `project_id`                  | string                       | The ID of the Google Cloud project where the Cloud SQL instance will be created.                                                                               | Yes      |                   |
| `region`                      | string                       | The region where the Cloud SQL instance will be deployed (e.g., `"us-central1"`).                                                                             | Yes      |                   |
| `name`                        | string                       | The name of the Cloud SQL instance. This name must be unique within the project.                                                                              | Yes      |                   |
| `database_version`            | string                       | The database version to use for the Cloud SQL instance (e.g., `"MYSQL_8_0"`, `"POSTGRES_14"`).                                                                | Yes      |                   |
| `tier`                        | string                       | The machine type to use for the Cloud SQL instance (e.g., `"db-n1-standard-1"`).                                                                               | Yes      |                   |
| `availability_type`           | string                       | The availability type for the Cloud SQL instance.  Valid values are `"ZONAL"` and `"REGIONAL"`.                                                                  | Yes      |                   |
| `prefix`                      | optional(string)             | A prefix to add to the Cloud SQL instance name.                                                                                                                | No       |                   |
| `activation_policy`           | optional(string)             | The activation policy for the Cloud SQL instance. Valid values are `"ALWAYS"`, `"ON_DEMAND"`, and `"NEVER"`. Default: `"ALWAYS"`.                            | No       | `"ALWAYS"`        |
| `backup_configuration`        | optional(Backup Configuration Object) | Configuration for backups.                                                                                                                                   | No       | `{}`                |
| `collation`                   | optional(string)             | The collation to use for the database (e.g., `"utf8mb4_general_ci"`).                                                                                               | No       |                   |
| `connector_enforcement`       | optional(string)             | The level of connector enforcement for the Cloud SQL instance.  Valid values depends on the `database_version`.                                                                                             | No       |                   |
| `data_cache`                  | optional(bool)             | The data_cache flag for the Cloud SQL instance.                                                                                               | No       |     `false`              |
| `databases`                   | optional(list(string))        | A list of database names to create on the instance.                                                                                                              | No       |                   |
| `disk_autoresize_limit`       | optional(number)             | The maximum disk size (in GB) for the Cloud SQL instance.  A value of `0` disables disk auto-resize.                                                              | No       | `0`                 |
| `disk_size`                   | optional(number)             | The initial disk size (in GB) for the Cloud SQL instance.                                                                                                              | No       |                   |
| `disk_type`                   | optional(string)             | The disk type to use for the Cloud SQL instance.  Valid values are `"PD_SSD"` and `"PD_HDD"`. Default: `"PD_SSD"`.                                                | No       | `"PD_SSD"`        |
| `edition`                     | optional(string)             | The edition of the database to use.  Valid values depend on the `database_version`. Default: `"ENTERPRISE"`.                                                            | No       | `"ENTERPRISE"`    |
| `encryption_key_name`       | optional(string)             | The KMS key name to use for encrypting the Cloud SQL instance.                                                                                                     | No       |                   |
| `flags`                       | optional(map(string))        | A map of database flags to set on the instance.                                                                                                                    | No       |                   |
| `gcp_deletion_protection`     | optional(bool)             | If set to `true`, prevents the instance from being accidentally deleted by Terraform. Default: `true`.                                                             | No       | `true`            |
| `insights_config`             | optional(Insights Config Object) | Configuration for query insights.                                                                                                                                   | No       |                   |
| `labels`                      | optional(map(string))        | A map of labels to apply to the instance.                                                                                                                              | No       |                   |
| `maintenance_config`          | optional(Maintenance Config Object) | Configuration for maintenance windows.                                                                                                                                 | No       | `{}`                |
| `network_config`              | optional(Network Config Object) | Configuration for network settings.                                                                                                                                    | No       |                   |
| `password_validation_policy`  | optional(Password Validation Policy Object)  | Configuration for the password validation policy.                                                                                                                                   | No     |       |
| `replicas`                    | optional(map(Replica Object))   | Replicas map configuration.  The key of the map is replica_name.                                                                                                                  | No   | `{}`          |
| `root_password`             | optional(Root Password Object)        | root password setting configuration.                                                                                          | No  | `{}`  |
| `ssl` | optional(SSL Object)        | SSL configuration. | No  | `{}`  |
|   `terraform_deletion_protection` | optional(bool)             | Protects the database instance from deletion. If set to false, the module won't apply Terraform deletion protection annotation                                                                                        | No | `true`  |
| `time_zone`                   | optional(string)             | The time zone to use for the instance (e.g., `"America/Los_Angeles"`).                                                                                                 | No       |                   |
| `users`                       | optional(map(User Object))       | A map defining database users to create on the instance.  The key of the map is the username.                                                                             | No       |                   |

#### Backup Configuration Object:

| Attribute                      | Type               | Description                                                                                                                                    | Required | Default           |
|--------------------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------|
| `enabled`                      | optional(bool)     | If set to `true`, backups are enabled for the instance. Default: `false`.                                                                       | No       | `false`           |
| `binary_log_enabled`           | optional(bool)     | If set to `true`, binary logging is enabled.  Required for point-in-time recovery. Default: `false`.                                          | No       | `false`           |
| `start_time`                   | optional(string)     | The start time for the daily backup, in the format `"HH:MM"` (e.g., `"23:00"` for 11 PM). Default: `"23:00"`.                               | No       | `"23:00"`         |
| `location`                     | optional(string)     | The location where the backups will be stored.  If not specified, backups are stored in the same region as the instance.                         | No       |                   |
| `log_retention_days`  | optional(number)     |  The number of days to retain backups.  | No       |     7              |
| `point_in_time_recovery_enabled`| optional(bool)     | Point in time recovery configuration. Cannot be used with MySQL second generation.  Default: `false`.                                         | No       |              |
| `retention_count`  | optional(number)    | The number of previous backups to keep.  | No    |    7         |

#### Insights Config Object:

| Attribute                   | Type     | Description                                                                                                            | Required | Default   |
| --------------------------- | -------- | ---------------------------------------------------------------------------------------------------------------------- | -------- | --------- |
| `query_string_length`     | optional(number)  | Query length in bytes.  Applied only to MySQL. Default: `1024`.                                                  | No       | `1024`    |
| `record_application_tags` | optional(bool)  | Record application tags. Applied only to PostgreSQL. Default: `false`.                                             | No       | `false`   |
| `record_client_address`   | optional(bool)  | Record client address.  Applied only to PostgreSQL. Default: `false`.                                             | No       | `false`   |
| `query_plans_per_minute`  | optional(number)  | Maximum query plans per minute.  Applied only to PostgreSQL.  Default: `5`.                                      | No       | `5`       |

#### Maintenance Config Object:

| Attribute            | Type      | Description                                                                             | Required | Default |
|----------------------|-----------|-----------------------------------------------------------------------------------------|----------|---------|
| `maintenance_window` | optional(Maintenance Window Object) | Configuration for a specific maintenance window.   Cannot be used with `deny_maintenance_period`.                      | No       |         |
|  `deny_maintenance_period` | optional(Deny Maintenance Period Object) | Configuration for a specific deny maintenance period.   Cannot be used with `maintenance_window`.                      | No       |         |

#### Maintenance Window Object:

| Attribute    | Type    | Description                                                                                     | Required | Default |
|------------|---------|-------------------------------------------------------------------------------------------------|----------|---------|
| `day`      | number  | The day of the week to perform maintenance.  Valid values are integers representing the days of the week, starting with `1` for Sunday. | Yes      |         |
| `hour`     | number  | The hour of the day to perform maintenance (in UTC).                                                                   | Yes      |         |
|  `update_track` | optional(string) |  Which update track you want this instance to receive. Can be `"canary"` or `"stable"`.  | No      |         |

#### Deny Maintenance Period Object:

| Attribute  | Type   | Description                                                               | Required | Default       |
| ---------- | ------ | ------------------------------------------------------------------------- | -------- | ------------- |
| `start_date` | string | Start date of the deny maintenance period format '"YYYY-MM-DD"'.  | Yes      | |
| `end_date`   | string | End date of the deny maintenance period format '"YYYY-MM-DD"'.    | Yes      |  |
| `start_time` | optional(string) | Start time of the window format '"HH:MM:SS"'.  | No       | `"00:00:00"`|

#### Network Config Object:

| Attribute             | Type                                        | Description                                                                                               | Required | Default |
|-----------------------|---------------------------------------------|-----------------------------------------------------------------------------------------------------------|----------|---------|
| `authorized_networks` | optional(map(string))          | A map defining authorized networks for the instance.  The key of the map is the network name, and the value is the CIDR block. | No       |         |
|  `connectivity` | object(Connectivity Object) | settings used to configure connectivity of the cloud sql instance.  | No |    |

#### Connectivity Object:

| Attribute  | Type    | Description | Required | Default |
| ---------- | ------- | ----------- | -------- | ------- |
| `public_ipv4` | optional(bool) | Whether to enable public IPv4 connectivity for the instance. Default: `false`.  | No       | `false`|
| `psa_config` | optional(PSA Config Object) | Private Service Access configuration. When configuring, public_ipv4 should be disabled.  | No    |  |
|  `psc_allowed_consumer_projects` | optional(list(string))  |  List of consumer projects that can connect to the cloud sql instance thourgh psc.  | No |     |
|  `enable_private_path_for_services` | optional(bool)  |  Enable private service access for services to connect to the cloud sql instance. | No | `false`    |

#### PSA Config Object:

| Attribute  | Type    | Description | Required | Default |
| ---------- | ------- | ----------- | -------- | ------- |
| `private_network` | string | The private network to use for Private Service Access.  | Yes |  |
| `allocated_ip_ranges` | optional(Allocated IP Ranges Object) | The allocated IP ranges to use for Private Service Access.  | No |  |

#### Allocated IP Ranges Object:

| Attribute  | Type    | Description | Required | Default |
| ---------- | ------- | ----------- | -------- | ------- |
| `primary` | optional(string) | Primary peered network that will be assigned.  | No |  |
| `replica` | optional(string) | Replica peered network that will be assigned.  | No |  |

#### Password Validation Policy Object:

| Attribute                      | Type             | Description                                                                                                                             | Required | Default |
| ------------------------------ | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `enabled`          | optional(bool)  | If True, the password validation policy is enabled.  | No | `true`  |
| `change_interval`             | optional(number) | Number of days that password is valid. If not set, there is no expiration.  | No |   |
| `default_complexity`  | optional(bool) | If True, the database's default policy for password complexity is used.  | No |   |
| `disallow_username_substring` | optional(bool) | If True, disallows the use of the username as a substring in the password.  | No |   |
| `min_length`                  | optional(number) | Minimum password length. If not set, the length has no limit.                | No       |                   |
| `reuse_interval`              | optional(number) | Number of previous passwords that cannot be reused.                                                                                  | No       |                   |

#### Replica Object:

| Attribute               | Type     | Description                                                                              | Required | Default |
| ----------------------- | -------- | ---------------------------------------------------------------------------------------- | -------- | ------- |
| `region`                | string   | The region where the replica will be created.                                             | Yes      |         |
| `encryption_key_name` | optional(string) | The KMS key name to use for encrypting the replica.                                    | No       |         |

#### Root Password Object:

| Attribute   | Type      | Description                                                                                                                                 | Required | Default |
|-------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `password`  | optional(string) | The password for the root user.  Required if `random_password` is `false`.                                                          | No       |         |
| `random_password` | optional(bool) | If set to `true`, a random password will be generated for the root user. Required if `password` is empty.   Default: `false`.      | No       | `false`   |

#### SSL Object:

| Attribute   | Type     | Description                                                                                                                                 | Required | Default |
|-------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `client_certificates`  | optional(list(string)) | A list of client certificate common names.  Required to set `mode` variable                                                         | No       |         |
| `mode` | optional(string) | The SSL mode for the instance.  Valid values are `ALLOW_UNENCRYPTED_AND_ENCRYPTED`, `ENCRYPTED_ONLY`.  If `client_certificates` variable isn't empty, mode variable is required.                                                                  | No    |        |

#### User Object:

| Attribute   | Type      | Description                                                                                    | Required | Default |
|-------------|-----------|------------------------------------------------------------------------------------------------|----------|---------|
| `password`  | optional(string) | The password for the user.                                                                 | No       |         |
| `type`      | optional(string) | The type of the user. Valid values depend on the database version.                       | No       |         |

