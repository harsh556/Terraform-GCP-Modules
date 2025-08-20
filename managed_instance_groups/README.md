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
| [instance-template](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/compute-vm | n/a |
| [mig](main.tf#L2) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/compute-mig | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [instance-templates](variables.tf#L1) | A map defining Compute Instance Template configurations. This input allows you to define multiple instance templates, which are used as blueprints for creating virtual machines in a Managed Instance Group (MIG). | <pre>map(object({<br/>    project_id      = string<br/>    template_name   = string<br/>    region          = string<br/>    description     = optional(string)<br/>    instance_type   = string<br/>    network_tags    = optional(list(string))<br/>    labels          = optional(map(string))<br/>    vpc             = string<br/>    subnet          = string<br/>    sa_email        = optional(string)<br/>    boot_disk_image = optional(string)<br/>    boot_disk_size  = optional(number)<br/>    boot_disk_type  = optional(string)<br/>  }))</pre> | `null` | no |
| [mig](#input_mig) | A map defining Managed Instance Group (MIG) configurations. This input allows you to define multiple MIGs, specifying the instance template to use, target size, scaling policies, and other settings. | <pre>map(object({<br/>    project_id   = string<br/>    location     = string<br/>    mig_name     = string<br/>    target_size  = string<br/>    template_key = string<br/>    max_replicas = number<br/>    min_replicas = number<br/>    scaling_signals = optional(object({<br/>      cpu_utilization = optional(object({<br/>        target                = number<br/>        optimize_availability = optional(bool)<br/>      }))<br/>      load_balancing_utilization = optional(object({<br/>        target = number<br/>      }))<br/>      metrics = optional(list(object({<br/>        name                       = string<br/>        type                       = optional(string) # GAUGE, DELTA_PER_SECOND, DELTA_PER_MINUTE<br/>        target_value               = optional(number)<br/>        single_instance_assignment = optional(number)<br/>        time_series_filter         = optional(string)<br/>      })))<br/>      schedules = optional(list(object({<br/>        duration_sec          = number<br/>        name                  = string<br/>        min_required_replicas = number<br/>        cron_schedule         = string<br/>        description           = optional(bool)<br/>        timezone              = optional(string)<br/>        disabled              = optional(bool)<br/>      })))<br/>    }), {})<br/>  }))</pre> | `null` | yes |

<a name="input_instance-templates"></a>

### `instance-templates` Details:

This input variable is a map where each key represents a unique identifier for a Compute Instance Template. The value associated with each key is an object defining the template's configuration.

#### Instance Template Configuration Object:

| Attribute          | Type     | Description                                                                                                                                                                                                | Required | Default |
|--------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`         | string   | The ID of the Google Cloud project where the instance template will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                   | Yes      |         |
| `template_name`      | string   | The name of the instance template. This name must be unique within the project and region. Example: `"my-instance-template"`.                                                                         | Yes      |         |
| `region`             | string   | The region where the instance template will be created. Example: `"us-central1"`.                                                                                                                         | Yes      |         |
| `description`        | optional(string) | A text description of the instance template.                                                                                                                                                     | No       |         |
| `instance_type`      | string   | The machine type to use for the instances created from this template. Example: `"n1-standard-1"`.                                                                                                      | Yes      |         |
| `network_tags`       | optional(list(string)) | A list of network tags to apply to the instances created from this template. These tags are used to identify and group instances for firewall rules and network configuration. Example: `["web", "backend"]`. | No       |         |
| `labels`             | optional(map(string)) | A map of labels to apply to the instances created from this template. Labels can be used for organization, filtering, and cost tracking. Example: `{"environment" = "production", "role" = "web"}`. | No       |         |
| `vpc`                | string   | The self-link of the VPC network used by the instances created from this template. Must be a valid VPC network. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/global/networks/my-vpc"`. | Yes      |         |
| `subnet`             | string   | The self-link of the subnetwork used by the instances created from this template. Must be a valid subnetwork within the same region as the instance template. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/regions/us-central1/subnetworks/my-subnet"`. | Yes      |         |
| `sa_email`           | optional(string) | The email address of the service account to associate with the instances created from this template. This service account will be used to authenticate the instances with other Google Cloud services. | No       |         |
| `boot_disk_image`    | optional(string) | The image to use for the boot disk of the instances created from this template. Example: `"ubuntu-os-cloud/ubuntu-2004-lts"`.                                                                    | No       |         |
| `boot_disk_size`     | optional(number) | The size of the boot disk in GB. Example: `50`.                                                                                                                                            | No       |         |
| `boot_disk_type`     | optional(string) | The type of the boot disk. Example: `"pd-standard"`.                                                                                                                                     | No       |         |

<a name="input_mig"></a>

### `mig` Details:

This input variable is a map where each key represents a unique identifier for a Managed Instance Group (MIG). The value associated with each key is an object defining the MIG's configuration.

#### MIG Configuration Object:

| Attribute             | Type                        | Description                                                                                                                                                                                                                | Required | Default |
|-----------------------|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `project_id`          | string                      | The ID of the Google Cloud project where the MIG will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                                                       | Yes      |         |
| `location`            | string                      | The location (region or zone) where the MIG will be created. For regional MIGs, specify the region (e.g., `"us-central1"`). For zonal MIGs, specify the zone (e.g., `"us-central1-a"`).                               | Yes      |         |
| `mig_name`            | string                      | The name of the MIG. This name must be unique within the project and location. Example: `"my-mig"`.                                                                                                                     | Yes      |         |
| `target_size`         | string                      | The target number of instances in the MIG.                                                                                                                                                                                 | Yes      |         |
| `template_key`        | string                      | The key of the instance template configuration in the `instance-templates` map to use for creating instances in this MIG. This establishes the link between the MIG and the instance template.                       | Yes      |         |
| `max_replicas`        | number                      | The maximum number of instances that the MIG can scale up to. Used for autoscaling.                                                                                                                                      | Yes      |         |
| `min_replicas`        | number                      | The minimum number of instances that the MIG will maintain. Used for autoscaling.                                                                                                                                      | Yes      |         |
| `scaling_signals`       | optional(object(...), {})   | Configuration for autoscaling signals. See "Scaling Signals Object" below for details. If `null`, autoscaling is not enabled.                                                                                          | No       | `{}`      |

#### Scaling Signals Object:

| Attribute                       | Type                        | Description                                                                                                                                                                                        | Required | Default |
|---------------------------------|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `cpu_utilization`             | optional(object(...))       | Configuration for CPU utilization-based autoscaling. See "CPU Utilization Object" below for details.                                                                                               | No       |         |
| `load_balancing_utilization`  | optional(object(...))       | Configuration for load balancing utilization-based autoscaling. See "Load Balancing Utilization Object" below for details.                                                                          | No       |         |
| `metrics`                     | optional(list(object(...))) | A list of custom metrics to use for autoscaling. See "Metrics Object" below for details.                                                                                                         | No       |         |
| `schedules`                   | optional(list(object(...))) | A list of schedules to use for autoscaling. This creates autoscaling based on defined times. See "Schedules Object" below for details. | No       |         |

#### CPU Utilization Object:

| Attribute               | Type     | Description                                                                                                                                     | Required | Default |
|-------------------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `target`                | number   | The target CPU utilization (0.0 to 1.0) that the autoscaler should maintain.                                                               | Yes      |         |
| `optimize_availability` | optional(bool)  |  Indicates whether the priority of the autoscaler should favor keeping the number of running VMs stable or distributing VMs evenly across zones.   | No      | |

#### Load Balancing Utilization Object:

| Attribute       | Type     | Description                                                                                                                                     | Required | Default |
|-----------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `target`        | number   | The target load balancing utilization (0.0 to 1.0) that the autoscaler should maintain.                                                       | Yes      |         |

#### Metrics Object:

| Attribute                     | Type     | Description                                                                                                                                                               | Required | Default |
|-------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `name`                        | string   | The name of the metric.                                                                                                                                                 | Yes      |         |
| `type`                        | optional(string) | The type of metric. Valid values are `"GAUGE"`, `"DELTA_PER_SECOND"`, and `"DELTA_PER_MINUTE"`.                                                                                                     | No      |          |
| `target_value`                | optional(number)   | The target value for the metric that the autoscaler should maintain.                                                                                                      | No      |         |
| `single_instance_assignment` | optional(number)  | If present, this represents the amount of the metric that is suitable for single instance assignment.                                                                                   | No      |         |
| `time_series_filter`    | optional(string)  | A filter expression that is used for defining a time series.    Example: `metric.type="agent.googleapis.com/memory/percent_used" resource.type="gce_instance"`                | No      |         |

#### Schedules Object:

| Attribute              | Type    | Description                                                                                                                                                                     | Required | Default |
|------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `duration_sec`         | number  | The length of time, in seconds, that the schedule should run. For example, one hour would be `3600`. | Yes      |        |
| `name`         | string  | The name of this schedule that will be created.  | Yes      |        |
| `min_required_replicas`         | number  |  The minimum number of instances to run during this schedule.  | Yes      |        |
| `cron_schedule`         | string  | A cron-like schedule that determines how often to run the changes.  | Yes      |        |
| `description`        | optional(bool)  | An optional human-readable description of the schedule.          | No      |        |
| `timezone`         | optional(string)  |  Time zone of the cron job using tz database name. Example: `America/Los_Angeles`.   If not specified, defaults to UTC. See [tz database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) for more information.        | No      |        |
| `disabled`  | optional(bool)      |  Setting it to true will disabled the schedule.  The schedule will not be automatically executed.                | No      |        |
