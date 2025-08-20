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
| [cloud\_run\_service](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/cloud-run-v2 | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [cloud\_run\_config](variable.tf#L1) | Configuration for Cloud Run services in a map format. | <pre>map(object({<br/>    project_id             = string<br/>    region                 = string<br/>    name                   = string<br/>    prefix                 = optional(string)<br/>    create_job             = optional(bool, false)<br/>    custom_audiences       = optional(list(string))<br/>    deletion_protection    = optional(bool)<br/>    encryption_key         = optional(string)<br/>    ingress                = optional(string)<br/>    labels                 = optional(map(string))<br/>    launch_stage           = optional(string)<br/>    service_account        = optional(string)<br/>    service_account_create = optional(bool, false)<br/>    tag_bindings           = optional(map(string))<br/>    vpc_connector_create = optional(object({<br/>      ip_cidr_range = optional(string)<br/>      machine_type  = optional(string)<br/>      name          = optional(string)<br/>      network       = optional(string)<br/>      instances = optional(object({<br/>        max = optional(number, 10)<br/>        min = optional(number, 2)<br/>      }), {})<br/>      throughput = optional(object({<br/>        max = optional(number)<br/>        min = optional(number)<br/>      }), {})<br/>      subnet = optional(object({<br/>        name       = optional(string)<br/>        project_id = optional(string)<br/>      }), {})<br/>    }))<br/><br/>    # Containers Configuration<br/>    containers = map(object({<br/>      image   = string<br/>      command = optional(list(string))<br/>      args    = optional(list(string))<br/>      env     = optional(map(string))<br/>      env_from_key = optional(map(object({<br/>        secret  = string<br/>        version = string<br/>      })))<br/>      liveness_probe = optional(object({<br/>        grpc = optional(object({<br/>          port    = optional(number)<br/>          service = optional(string)<br/>        }))<br/>        http_get = optional(object({<br/>          http_headers = optional(map(string))<br/>          path         = optional(string)<br/>        }))<br/>        failure_threshold     = optional(number)<br/>        initial_delay_seconds = optional(number)<br/>        period_seconds        = optional(number)<br/>        timeout_seconds       = optional(number)<br/>      }))<br/>      ports = optional(map(object({<br/>        container_port = optional(number)<br/>        name           = optional(string)<br/>      })))<br/>      resources = optional(object({<br/>        limits = optional(object({<br/>          cpu    = string<br/>          memory = string<br/>        }))<br/>        cpu_idle          = optional(bool)<br/>        startup_cpu_boost = optional(bool)<br/>      }))<br/>      startup_probe = optional(object({<br/>        grpc = optional(object({<br/>          port    = optional(number)<br/>          service = optional(string)<br/>        }))<br/>        http_get = optional(object({<br/>          http_headers = optional(map(string))<br/>          path         = optional(string)<br/>        }))<br/>        tcp_socket = optional(object({<br/>          port = optional(number)<br/>        }))<br/>        failure_threshold     = optional(number)<br/>        initial_delay_seconds = optional(number)<br/>        period_seconds        = optional(number)<br/>        timeout_seconds       = optional(number)<br/>      }))<br/>      volume_mounts = optional(map(string))<br/>    }))<br/><br/>    # Eventarc Triggers<br/>    eventarc_triggers = optional(object({<br/>      audit_log = optional(map(object({<br/>        method  = string<br/>        service = string<br/>      })))<br/>      pubsub                 = optional(map(string))<br/>      service_account_email  = optional(string)<br/>      service_account_create = optional(bool, false)<br/>    }), {})<br/><br/>    # IAM Bindings<br/>    iam = optional(map(list(string)), {})<br/><br/>    # Revision Configuration<br/>    revision = optional(object({<br/>      name                       = optional(string)<br/>      gen2_execution_environment = optional(bool)<br/>      max_concurrency            = optional(number)<br/>      max_instance_count         = optional(number)<br/>      min_instance_count         = optional(number)<br/>      job = optional(object({<br/>        max_retries = optional(number)<br/>        task_count  = optional(number)<br/>      }), {})<br/>      vpc_access = optional(object({<br/>        connector = optional(string)<br/>        egress    = optional(string)<br/>        network   = optional(string)<br/>        subnet    = optional(string)<br/>        tags      = optional(list(string))<br/>      }), {})<br/>      timeout = optional(string)<br/>    }), {})<br/><br/>    # Volumes Configuration<br/>    volumes = optional(map(object({<br/>      secret = optional(object({<br/>        name         = string<br/>        default_mode = optional(string)<br/>        path         = optional(string)<br/>        version      = optional(string)<br/>        mode         = optional(string)<br/>      }))<br/>      cloud_sql_instances = optional(list(string))<br/>      empty_dir_size      = optional(string)<br/>      gcs = optional(object({<br/>        bucket       = string<br/>        is_read_only = optional(bool)<br/>      }))<br/>      nfs = optional(object({<br/>        server       = string<br/>        path         = optional(string)<br/>        is_read_only = optional(bool)<br/>      }))<br/>    })), {})<br/>  }))</pre> | n/a | yes |

<a name="input_cloud_run_config"></a>

### `cloud_run_config` Details:

This input variable is a map where each key represents an identifier for a Cloud Run service. The value associated with each key is an object defining the Cloud Run service's configuration.

#### Cloud Run Service Configuration Object:

| Attribute              | Type                          | Description                                                                                                                                                                               | Required | Default       |
|------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------------|
| `project_id`           | string                        | The ID of the Google Cloud project where the Cloud Run service will be created.                                                                                                          | Yes      |               |
| `region`               | string                        | The region where the Cloud Run service will be deployed (e.g., `"us-central1"`).                                                                                                        | Yes      |               |
| `name`                 | string                        | The name of the Cloud Run service.  This name must be unique within the region.                                                                                                        | Yes      |               |
| `prefix`                 | optional(string)                        | The prefix of the Cloud Run service.                                                                                                          | No      |               |
| `create_job`           | optional(bool)                | If set to `true`, a Cloud Run Job will be created instead of a service.  Default: `false`.                                                                                                 | No       | `false`         |
| `custom_audiences`     | optional(list(string))        | A list of allowed custom audiences for the service.                                                                                                                                     | No       |               |
| `deletion_protection`  | optional(bool)                | If set to `true`, prevents the service from being deleted.                                                                                                                            | No       |               |
| `encryption_key`       | optional(string)                | The KMS key used to encrypt the service.                                                                                                                                               | No       |               |
| `ingress`              | optional(string)                | The ingress settings for the service. Valid values are `"INGRESS_TRAFFIC_ALL"`, `"INGRESS_TRAFFIC_INTERNAL_ONLY"`, and `"INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"`.                 | No       |               |
| `labels`               | optional(map(string))         | A map of labels to apply to the service.                                                                                                                                              | No       |               |
| `launch_stage`         | optional(string)                | The launch stage of the service.                                                                                                                                                      | No       |               |
| `service_account`      | optional(string)                | The email address of the service account to use for the service.                                                                                                                      | No       |               |
| `service_account_create`| optional(bool)                | If set to `true`, a service account will be created for the service. Default: `false`.                                                                                               | No       | `false`         |
| `tag_bindings`         | optional(map(string))                | A map of tag keys and values to apply to the service.   Requires the Tag Manager API to be enabled.                                                                                                          | No       |               |
| `vpc_connector_create` | optional(VPC Connector Create Object) | Configuration for creating a VPC Access connector.                                                                                                                              | No       |               |

#### VPC Connector Create Object:

| Attribute        | Type                          | Description                                                                                                                                                         | Required | Default |
|------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `ip_cidr_range`  | optional(string)                | The IP CIDR range to use for the connector (e.g., `"10.8.0.0/28"`).                                                                                                    | No       |         |
| `machine_type`   | optional(string)                | The machine type to use for the connector (e.g., `"e2-standard-4"`).                                                                                                    | No       |         |
| `name`           | optional(string)                | The name of the connector.                                                                                                                                          | No       |         |
| `network`        | optional(string)                | The VPC network to use for the connector.                                                                                                                               | No       |         |
| `instances`  | optional(Instances Object)           | The instances configuration of the vpc connector.                                                                                      | No       | `{}`         |
| `throughput` | optional(Throughput Object)          | The throughput configuration of the vpc connector.                                                                                                             | No       | `{}`         |
| `subnet`     | optional(Subnet Object)   | The subnet object configuration.                                                                                       | No       |  |

#### Instances Object:

| Attribute  | Type      | Description                                                                                                         | Required | Default |
| ---------- | ----------- | ------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `max`      | optional(number) | Maximum instances count. Default: `10`.                 | No       | `10`    |
| `min`      | optional(number) | Minimum instances count. Default: `2`.                 | No       | `2`     |

#### Throughput Object:

| Attribute  | Type      | Description                                                                                                         | Required | Default |
| ---------- | ----------- | ------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `max`      | optional(number) | Maximum  throughput of the vpc connector.                 | No       |     |
| `min`      | optional(number) | Minimum throughput of the vpc connector.                 | No       |      |

#### Subnet Object:

| Attribute  | Type      | Description                                                                                                         | Required | Default |
| ---------- | ----------- | ------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `name`     | optional(string) | The subnet to connect to. Either the subnet or network field has to be specified.                 | No       |     |
| `project_id` | optional(string) | Project the connection to.                 | No       |      |

#### Containers Object:

| Attribute        | Type                          | Description                                                                                                                                                   | Required | Default |
|------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `image`          | string                        | The container image URL (e.g., `"gcr.io/my-project/my-image:latest"`).                                                                                               | Yes      |         |
| `command`        | optional(list(string))        | A list of commands to execute in the container. If not provided, the container's default command is used.                                                   | No       |         |
| `args`           | optional(list(string))        | A list of arguments to pass to the command.                                                                                                                    | No       |         |
| `env`            | optional(map(string))         | A map of environment variables to set in the container.                                                                                                       | No       |         |
| `env_from_key`   | optional(map(Env From Key Object)) | A map defining environment variables to be sourced from Secrets.     | No       |         |
| `liveness_probe`   | optional(Liveness Probe Object)       |  A probe to check whether the container is running.                                                                                                | No       |         |
| `ports`          | optional(map(Port Object))        | A map defining the ports to expose from the container.   | No       |         |
| `resources`      | optional(Resources Object)      | Configuration for the container's resource limits.                                                                                                            | No       |         |
| `startup_probe`    | optional(Startup Probe Object)    |  A probe to check whether the container has started.                                                                                              | No       |         |
| `volume_mounts`  | optional(map(string))         | A map defining volume mounts for the container. The key is the mount path within the container, the value is the volume name.                                 | No       |         |

#### Env From Key Object:

| Attribute | Type   | Description                                                                        | Required | Default |
| --------- | ------ | ---------------------------------------------------------------------------------- | -------- | ------- |
| `secret`  | string | The name of the secret to read from.                                               | Yes      |         |
| `version` | string | The version of the secret to read.                                                | Yes      |         |

#### Liveness Probe Object:

| Attribute             | Type                      | Description                                                                                                                               | Required | Default |
| --------------------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `grpc`                | optional(GRPC Probe Object)     | Configuration for a gRPC liveness probe. Cannot be used with `http_get`.                                                                       | No       |         |
| `http_get`            | optional(HTTP Get Probe Object) | Configuration for an HTTP GET liveness probe. Cannot be used with `grpc` or `tcp_socket`.                                                                     | No       |         |
| `tcp_socket`        | optional(TCP Socket Object)   | Configuration for a TCP Socket probe. Cannot be used with `grpc` or `http_get`.  | No       |         |
| `failure_threshold`     | optional(number)            | The number of consecutive failures required to consider the probe failed.                                                                    | No       |         |
| `initial_delay_seconds` | optional(number)            | The number of seconds to wait before starting the probe.                                                                                    | No       |         |
| `period_seconds`        | optional(number)            | How often (in seconds) to perform the probe.                                                                                                | No       |         |
| `timeout_seconds`       | optional(number)            | Number of seconds after which the probe times out.                                                                                           | No       |         |

#### Startup Probe Object:

| Attribute             | Type                      | Description                                                                                                                               | Required | Default |
| --------------------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `grpc`                | optional(GRPC Probe Object)     | Configuration for a gRPC startup probe. Cannot be used with `http_get` or `tcp_socket`.                                                                      | No       |         |
| `http_get`            | optional(HTTP Get Probe Object) | Configuration for an HTTP GET startup probe. Cannot be used with `grpc` or `tcp_socket`.                                                                    | No       |         |
| `tcp_socket`        | optional(TCP Socket Object)   | Configuration for a TCP Socket probe. Cannot be used with `grpc` or `http_get`.  | No       |         |
| `failure_threshold`     | optional(number)            | The number of consecutive failures required to consider the probe failed.                                                                    | No       |         |
| `initial_delay_seconds` | optional(number)            | The number of seconds to wait before starting the probe.                                                                                    | No       |         |
| `period_seconds`        | optional(number)            | How often (in seconds) to perform the probe.                                                                                                | No       |         |
| `timeout_seconds`       | optional(number)            | Number of seconds after which the probe times out.                                                                                           | No       |         |

#### GRPC Probe Object:

| Attribute | Type   | Description                                                            | Required | Default |
| --------- | ------ | ---------------------------------------------------------------------- | -------- | ------- |
| `port`    | optional(number) | The port number to probe.                                             | No       |         |
| `service` | optional(string) | The service name to probe.                                            | No       |         |

#### HTTP Get Probe Object:

| Attribute      | Type                 | Description                                                                                               | Required | Default |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------|----------|---------|
| `http_headers` | optional(map(string)) | A map of HTTP headers to send with the probe request.                                                       | No       |         |
| `path`         | optional(string)       | The HTTP path to request for the probe (e.g., `"/healthz"`).                                                   | No       |         |

#### TCP Socket Object:

| Attribute      | Type                 | Description                                                                                               | Required | Default |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------|----------|---------|
| `port`         | optional(number)       | The port number to probe.                                                   | No       |         |

#### Port Object:

| Attribute        | Type     | Description                                                                                                | Required | Default |
|------------------|----------|------------------------------------------------------------------------------------------------------------|----------|---------|
| `container_port` | optional(number) | The port number that the container exposes.                                                                       | No       |         |
| `name`           | optional(string) | The name of the port.                                                                                              | No       |         |

#### Resources Object:

| Attribute | Type               | Description                                                                                                                                                              | Required | Default |
| --------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `limits`  | optional(Limits Object) | Configuration for resource limits.   If specified then `cpu_idle` and `startup_cpu_boost` cannot be set                                                                                               | No       |         |
| `cpu_idle`   | optional(bool)  | If set to `true`, allow the container to run without any CPU assigned. Default is `false`  If specified then `limits` cannot be set  | No       |    |
| `startup_cpu_boost`   | optional(bool)  |  If set to `true`, allocate additional CPU to the container during startup.  If specified then `limits` cannot be set | No       |    |

#### Limits Object:

| Attribute | Type   | Description                                                                           | Required | Default |
| --------- | ------ | ------------------------------------------------------------------------------------- | -------- | ------- |
| `cpu`     | string | The CPU limit for the container (e.g., `"1000m"` for 1 CPU core).                     | Yes      |         |
| `memory`  | string | The memory limit for the container (e.g., `"512Mi"` for 512 MB).                      | Yes      |         |

#### Eventarc Triggers Object:

| Attribute             | Type                      | Description                                                                                                                                                                           | Required | Default |
| --------------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `audit_log`           | optional(map(Audit Log Trigger Object))    | A map defining triggers based on Audit Logs. The key of the map is the name of the trigger.  See                                                                                                                                                | No       | `{}`      |
| `pubsub`              | optional(map(string))      | A map defining triggers based on Pub/Sub topics. The key of the map is the trigger name, and the value is the Pub/Sub topic name.                                                                | No       |         |
| `service_account_email` | optional(string)           | The email address of the service account to use for the Eventarc triggers.                                                                                                                | No       |         |
| `service_account_create`| optional(bool)           | If set to `true`, a service account will be created for the Eventarc triggers. Default: `false`.                                                                                              | No       | `false`         |

#### Audit Log Trigger Object:

| Attribute | Type   | Description                                                                            | Required | Default |
| --------- | ------ | -------------------------------------------------------------------------------------- | -------- | ------- |
| `method`  | string | The method name to trigger on (e.g., `"google.cloud.storage.v1.Storage.GetObject"`). | Yes      |         |
| `service` | string | The service name to trigger on (e.g., `"storage.googleapis.com"`).                   | Yes      |         |

#### IAM Bindings:

| Attribute         | Type                      | Description                                                                                                                                                                               | Required | Default |
|--------------------|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
|  `iam`    | optional(map(list(string)))      | Map of IAM roles and list of members to bind to that role                                                                                                                                                | No       |       {}   |

#### Revision Object:

| Attribute                       | Type                                                        | Description                                                                                                                                                                           | Required | Default |
| ------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `name`                          | optional(string)                                            | The name of the revision.  If not provided, a default revision name is generated.                                                                                                | No       |         |
| `gen2_execution_environment`    | optional(bool)                                              | If set to `true`, the revision will use the Gen2 execution environment.                                                                                                             | No       |         |
| `max_concurrency`               | optional(number)                                            | The maximum number of requests that can be handled by a single instance of the revision.                                                                                           | No       |         |
| `max_instance_count`            | optional(number)                                            | The maximum number of instances that can be created for the revision.                                                                                                                 | No       |         |
| `min_instance_count`            | optional(number)                                            | The minimum number of instances that must be running for the revision.                                                                                                                | No       |         |
| `job`              | optional(Job Object)            | Job configuration.                                                                     | No       |       |
| `vpc_access`                    | optional(VPC Access Object)                                 | Configuration for VPC Access.                                                                                                                                                       | No       |         |
| `timeout`                       | optional(string)                                            | The maximum duration a request can last, represented in the format of "X[smh]", where X is an integer and s, m, or h represents seconds, minutes, or hours (e.g., `"300s"` for 5 minutes). | No       |         |

#### Job Object:

| Attribute     | Type             | Description                                                                                                                                          | Required | Default |
|---------------|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `max_retries` | optional(number) | Number of retries.                                                                                                                                 | No       |         |
| `task_count`  | optional(number) | Number of tasks that should be executed in total. Overrides the spec's task_count  | No       |         |

#### VPC Access Object:

| Attribute   | Type   | Description | Required | Default |
| --------- | ------ | ----------- | -------- | ------- |
| `connector` | optional(string) | VPC Access connector name.  | No | |
| `egress` | optional(string) | Egress option.  | No | |
| `network` | optional(string) | Network resource.  | No | |
| `subnet` | optional(string) | Subnet resource.  | No | |
| `tags`   | optional(list(string))  |  List of string used to tag the vms. | No |    |

#### Volumes Object:

| Attribute          | Type          | Description                                                                                                                                                   | Required | Default |
| ------------------ | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `secret`           | optional(Secret Volume Object)  | Configuration for a volume backed by a secret.  Cannot be used with `cloud_sql_instances`, `empty_dir_size` , `gcs`, or `nfs`.                                                                                                | No       |         |
| `cloud_sql_instances`| optional(list(string))   | Used to specify the cloud sql instance. Used as mount point.  Cannot be used with `secret`, `empty_dir_size` , `gcs`, or `nfs`.                                                                                                         | No       |         |
| `empty_dir_size`| optional(string) |  Used to specify size of `emptyDir` volume. Used as mount point.  Cannot be used with `secret`, `cloud_sql_instances`,  `gcs`, or `nfs`.                                                                                                | No       |         |
| `gcs`           | optional(GCS Volume Object) | Configuration for a volume backed by a Google Cloud Storage bucket. Cannot be used with `secret`, `cloud_sql_instances`, `empty_dir_size` , or `nfs`.  | No       |         |
| `nfs`          | optional(NFS Volume Object)  |  Configuration for a volume backed by nfs.  Cannot be used with `secret`, `cloud_sql_instances`, `empty_dir_size` , or `gcs`.                                                                                                | No       |         |

#### Secret Volume Object:

| Attribute        | Type     | Description                                                                                                                                                                                | Required | Default |
|------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `name`           | string   | The name of the secret to mount.                                                                                                                                                         | Yes      |         |
| `default_mode`   | optional(string) | Integer representation of the default access mode to use on created directory. These are POSIX permissions like rwxrwxrwx.  | No       |  |
| `path`           | optional(string) | Path under the secret volume that will exposed to container. When specified, only the secret field may be populated using the subPath field.  | No       |  |
| `version`           | optional(string) | Version of the secret (version number or alias). Defaults to 'latest'.  | No       |  |
| `mode`           | optional(string) | Mode bits to use on this file, must be a value between 0000 and 0777 (octal). If 0 no special permissions are set. By default, 644 is used.  | No       |  |

#### GCS Volume Object:

| Attribute        | Type     | Description                                                                                                                                                                                | Required | Default |
|------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `bucket`           | string   | Bucket name.  | Yes      |         |
| `is_read_only`   | optional(bool) | Is the volume read only ? Default value is false.  | No      |  |

#### NFS Volume Object:

| Attribute        | Type     | Description                                                                                                                                                                                | Required | Default |
|------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `server`           | string   | NFS server address.  | Yes      |         |
| `path`   | optional(string) | Path that is exported by the NFS server. Defaults to '/'.  | No      |  |
| `is_read_only`   | optional(bool) | Is the volume read only ? Default value is false.  | No      |  |

