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
| [ilb](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-int | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [ilb\_config](variable.tf#L1) | Configuration for Internal Load Balancer (ILB) in a map format. This input allows you to define multiple ILBs with their backend services, forwarding rules, instance groups, and health checks. | <pre>map(object({<br/><br/>    project_id = string<br/>    region     = string<br/>    name       = string<br/>    vpc_config = object({<br/>      network    = string<br/>      subnetwork = string<br/>    })<br/><br/>    <br/>    description = optional(string, "Terraform managed.")<br/>    backend_service_config = optional(object({<br/>      connection_draining_timeout_sec = optional(number)<br/>      connection_tracking = optional(object({<br/>        idle_timeout_sec          = optional(number)<br/>        persist_conn_on_unhealthy = optional(string)<br/>        track_per_session         = optional(bool)<br/>      }))<br/>      enable_subsetting = optional(bool)<br/>      failover_config = optional(object({<br/>        disable_conn_drain        = optional(bool)<br/>        drop_traffic_if_unhealthy = optional(bool)<br/>        ratio                     = optional(number)<br/>      }))<br/>      log_sample_rate  = optional(number)<br/>      name             = optional(string)<br/>      protocol         = optional(string, "UNSPECIFIED")<br/>      session_affinity = optional(string)<br/>      timeout_sec      = optional(number)<br/>    }), {})<br/>    backends = optional(list(object({<br/>      group       = string<br/>      description = optional(string, "Terraform managed.")<br/>      failover    = optional(bool, false)<br/>    })), [])<br/>    forwarding_rules_config = optional(map(object({<br/>      address       = optional(string)<br/>      description   = optional(string)<br/>      global_access = optional(bool, true)<br/>      ipv6          = optional(bool, false)<br/>      name          = optional(string)<br/>      ports         = optional(list(string), null)<br/>      protocol      = optional(string, "TCP")<br/>    })), {})<br/>    group_configs = optional(map(object({<br/>      zone        = string<br/>      description = optional(string, "Terraform managed.")<br/>      instances   = optional(list(string))<br/>      named_ports = optional(map(number), {})<br/>    })), {})<br/>      health_check        = optional(string)<br/>      health_check_config = optional(object({<br/>        check_interval_sec  = optional(number)<br/>        description         = optional(string, "Terraform managed.")<br/>        enable_logging      = optional(bool, false)<br/>        healthy_threshold   = optional(number)<br/>        name                = optional(string)<br/>        timeout_sec         = optional(number)<br/>        unhealthy_threshold = optional(number)<br/>        grpc = optional(object({<br/>          port               = optional(number)<br/>          port_name          = optional(string)<br/>          port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>          service_name       = optional(string)<br/>        }))<br/>        http = optional(object({<br/>          host               = optional(string)<br/>          port               = optional(number)<br/>          port_name          = optional(string)<br/>          port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>          proxy_header       = optional(string)<br/>          request_path       = optional(string)<br/>          response           = optional(string)<br/>        }))<br/>        http2 = optional(object({<br/>          host               = optional(string)<br/>          port               = optional(number)<br/>          port_name          = optional(string)<br/>          port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>          proxy_header       = optional(string)<br/>          request_path       = optional(string)<br/>          response           = optional(string)<br/>        }))<br/>        https = optional(object({<br/>          host               = optional(string)<br/>          port               = optional(number)<br/>          port_name          = optional(string)<br/>          port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>          proxy_header       = optional(string)<br/>          request_path       = optional(string)<br/>          response           = optional(string)<br/>        }))<br/>        tcp = optional(object({<br/>          port               = optional(number)<br/>          port_name          = optional(string)<br/>          port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>          proxy_header       = optional(string)<br/>          request            = optional(string)<br/>          response           = optional(string)<br/>        }))<br/>        ssl = optional(object({<br/>          port               = optional(number)<br/>          port_name          = optional(string)<br/>          port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>          proxy_header       = optional(string)<br/>          request            = optional(string)<br/>          response           = optional(string)<br/>        }))<br/>    }), {})<br/>    labels = optional(map(string), {})<br/>    service_attachments = optional(map(object({<br/>      nat_subnets           = list(string)<br/>      automatic_connection  = optional(bool, false)<br/>      consumer_accept_lists = optional(map(string), {})<br/>      consumer_reject_lists = optional(list(string))<br/>      description           = optional(string)<br/>      domain_name           = optional(string)<br/>      enable_proxy_protocol = optional(bool, false)<br/>      reconcile_connections = optional(bool)<br/>    })), {})<br/>    service_label = optional(string)<br/>  }))</pre> | `null` | yes |

<a name="input_ilb_config"></a>

### `ilb_config` Details:

This input variable is a map where each key represents a unique identifier for an Internal Load Balancer (ILB). The value associated with each key is an object defining the ILB's configuration.

#### ILB Configuration Object:

| Attribute                     | Type                        | Description                                                                                                                                                                                                    | Required | Default                    |
|-------------------------------|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------------------------|
| `project_id`                  | string                      | The ID of the Google Cloud project where the ILB will be created.  Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                                    | Yes      |                            |
| `region`                      | string                      | The region where the ILB will be created. Example: `"us-central1"`.                                                                                                                                             | Yes      |                            |
| `name`                        | string                      | The name of the ILB. This name must be unique within the region and project. Example: `"my-ilb"`.                                                                                                            | Yes      |                            |
| `vpc_config`                  | object(...)                 | Configuration for the VPC network and subnetwork used by the ILB. See "VPC Configuration Object" below for details.                                                                                            | Yes      |                            |
| `description`               | optional(string, "Terraform managed.")                     | A text description of the ILB. | No  | `"Terraform managed."`                         |
| `backend_service_config`  | optional(object(...), {}) | Configuration for the backend service associated with the ILB.  See "Backend Service Configuration Object" below for details.                                                                                  | No       | `{}`                       |
| `backends`                    | optional(list(object(...)), []) | A list of backend instance groups to be added to the backend service.  See "Backend Object" below for details.  If `null`, no backends are added initially.                                                                   | No       | `[]`                       |
| `forwarding_rules_config`     | optional(map(object(...)), {}) | A map defining forwarding rules for the ILB.  Each key is a unique identifier for the rule. See "Forwarding Rule Configuration Object" below for details. If `null`, no forwarding rules are created.      | No       | `{}`                       |
| `group_configs`               | optional(map(object(...)), {}) | A map defining instance group configurations. This is used if creating the instance group here, rather than referencing an existing one. Each key is a unique identifier for the group. See "Group Configuration Object" below for details. | No       | `{}`                       |
| `health_check`               | optional(string)                       | The self_link of existing health check to use with this ILB. If not set, health_check_config must be used to create a new one. | No      |       |
| `health_check_config`    | optional(object(...), {})           | Configuration for the health check associated with the backend service.  See "Health Check Configuration Object" below for details. If `null`, a default health check is created.                                   | No   | `{}`   |
| `labels`                      | optional(map(string), {})        | A map of labels to apply to the ILB. Labels can be used for organization, filtering, and cost tracking.  Example: `{"environment" = "production", "team" = "platform"}`.                                 | No       | `{}`                       |
| `service_attachments`    | optional(map(object(...)), {})     | A map defining service attachments for the ILB. See "Service Attachment Configuration Object" below for details.                                                                                              | No       | `{}`   |
| `service_label`               | optional(string)                       | An optional service label for the ILB.

#### VPC Configuration Object:

| Attribute   | Type     | Description                                                                                                                                                                    | Required | Default |
|-------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `network`   | string   | The self-link of the VPC network used by the ILB. Must be a valid VPC network. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/global/networks/my-vpc"`. | Yes      |         |
| `subnetwork`| string   | The self-link of the subnetwork used by the ILB. Must be a valid subnetwork within the same region as the ILB. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/regions/us-central1/subnetworks/my-subnet"`. | Yes      |         |

#### Backend Service Configuration Object:

| Attribute                             | Type                        | Description                                                                                                                                                              | Required | Default         |
|---------------------------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------|
| `connection_draining_timeout_sec`     | optional(number)            | The amount of time (in seconds) for which connections to a removed backend will remain open.                                                                         | No       |                 |
| `connection_tracking` | optional(object(...))           | Configures connection tracking policy for the backend service. For more details, please check the documentation.                                                                         | No       |                 |
| `enable_subsetting` | optional(bool)            | Consistent Hash Subsetting for the load balancer to reduce management overhead and provide a consistent experience. The load balancer only forwards traffic to a subset of all backend instances. If enabled, subset size will use `max_connections` or `max_rate` from associated instance groups.        | No       |        |
| `failover_config`         | optional(object(...))         | Configuration for failover settings for the backend service.  See "Failover Configuration Object" below for details.                                            | No       |        |
| `log_sample_rate`                     | optional(number)            | The percentage of traffic for which logging is enabled. Must be between 0.0 and 1.0.                                                                                 | No       |                 |
| `name`                                | optional(string)            | The name of the backend service. If not provided a name will be generated.                                                                          | No       |                 |
| `protocol`                            | optional(string, "UNSPECIFIED") | The protocol used for traffic between the load balancer and the backend instances. Valid values are `"TCP"`, `"UDP"`, `"HTTP"`, `"HTTPS"`, `"HTTP2"`, `"SSL"`, and `"UNSPECIFIED"`. | No       | `"UNSPECIFIED"` |
| `session_affinity`                    | optional(string)            | The session affinity setting for the backend service.  Valid values are `"NONE"`, `"CLIENT_IP"`, `"CLIENT_IP_PROTO"`, and `"CLIENT_IP_PORT_PROTO"`.                 | No       |                 |
| `timeout_sec`                         | optional(number)            | The amount of time (in seconds) that the load balancer will wait for a backend to respond before failing the request.                                                | No       |                 |

#### Connection Tracking Configuration Object:

| Attribute                      | Type    | Description                                                                                                                                              | Required | Default |
|--------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `idle_timeout_sec`               | optional(number) | Lifetime of each connection for connection tracking policy.  Valid values are 300-86400.                                                                                 | No      |        |
| `persist_conn_on_unhealthy` | optional(string) | Specifies connection persistence when connection draining on backends is enabled.  Valid values are `"DEFAULT_FOR_PROTOCOL"`, `"NEVER_PERSIST"`. | No        |      |
| `track_per_session` | optional(bool)  | Specifies whether to track connections on a per-session basis or not.                                                                         | No       |         |

#### Failover Configuration Object:

| Attribute                         | Type    | Description                                                                                                                                                                             | Required | Default |
|-----------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `disable_conn_drain`                | optional(bool) | This means that after failover, any connections that were being drained from this group will be terminated immediately.                                                                                 | No      |        |
| `drop_traffic_if_unhealthy` | optional(bool) | The option to drain any existing connections. Connections to the removed backend will not be dropped, but new connections will not be accepted. `false` means new traffic will be routed towards the active pool even if there are known unhealthy backends..                                                                       | No       |         |
| `ratio`   | optional(number)  |  Traffic is distributed proportionally between all backends that are not failing over.	Value needs to be between 0 to 1.  For more details, please check the documentation.                         | No       |      |

#### Backend Object:

| Attribute   | Type     | Description                                                                                                                                                                    | Required | Default                 |
|-------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------------|
| `group`     | string   | The self-link of the instance group or network endpoint group (NEG) that will serve as the backend.  Must be a valid instance group or NEG. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/zones/us-central1-a/instanceGroups/my-instance-group"`. | Yes      |                         |
| `description`| optional(string, "Terraform managed.")  | A text description of the Backend. | No  | `"Terraform managed."`                         |
| `failover`| optional(bool, false)  | Used for failover scenario. If `true` it means that this group represents the `failover` group. See failover configuration for further details. | No  |   `false`                      |

#### Forwarding Rule Configuration Object:

| Attribute       | Type                | Description                                                                                                                                                                                 | Required | Default        |
|-----------------|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------------|
| `address`       | optional(string)    | The IP address that the forwarding rule will use. If not provided, an ephemeral internal IP address will be assigned.                                                                     | No       |                |
| `description`   | optional(string)    | A description of the forwarding rule.                                                                                                                                                       | No       |                |
| `global_access` | optional(bool, true)  | If set to true, connections can be routed to the ILB from any region. If set to false, connections are restricted to the ILB's region. | No       | `true`              |
| `ipv6`  | optional(bool, false)  |  If set to true, the ILB will use IPv6. Default false  | No       | `false`              |
| `name`          | optional(string)    | The name of the forwarding rule. If not provided a name will be generated.                                                                      | No       |                |
| `ports`         | optional(list(string), null) | A list of ports that the forwarding rule will listen on. Specify port numbers or port ranges. Example: `["80", "443", "1000-2000"]`. If null/empty, all ports are forwarded.                   | No       | `null`           |
| `protocol`      | optional(string, "TCP")  | The protocol that the forwarding rule will use. Valid values are `"TCP"`, `"UDP"`, and `"L3_DEFAULT"`.     | No       |`"TCP"`          |

#### Group Configuration Object:

| Attribute     | Type                | Description                                                                                                                                | Required | Default                 |
|---------------|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------------|
| `zone`        | string              | The zone where the instance group or NEG will be created.  Example: `"us-central1-a"`.                                                       | Yes      |                         |
| `description` | optional(string, "Terraform managed.")   | A text description of the Group. | No  | `"Terraform managed."`                        |
| `instances`   | optional(list(string)) | A list of instance self-links to add to the group. If not specified, it is possible to add instances in the future using separate resources or tools. | No       |                         |
| `named_ports` | optional(map(number), {}) | A map of named ports to configure on the instance group. Keys are port names and values are port numbers. Example: `{"http" = 80, "https" = 443}`.           | No       | `{}`                       |

#### Health Check Configuration Object:

| Attribute             | Type                | Description                                                                                                                                  | Required | Default                                              |
|-----------------------|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------------------------------------------|
| `check_interval_sec`  | optional(number)    | How often (in seconds) to send a health check.                                                                                             | No       |                                                      |
| `description`         | optional(string, "Terraform managed.")   | A text description of the Health Check. | No  | `"Terraform managed."`                        |
| `enable_logging`      | optional(bool, false) | Indicates whether or not to log the results of the health check.                                                                         | No       | `false`                                              |
| `healthy_threshold`   | optional(number)    | The number of consecutive successful health checks required before considering an instance healthy.                                           | No       |                                                      |
| `name`                | optional(string)    | The name of the health check. If not provided, a name will be generated.                                                                 | No       |                                                      |
| `timeout_sec`         | optional(number)    | How long (in seconds) to wait for a response from the instance.                                                                          | No       |                                                      |
| `unhealthy_threshold` | optional(number)    | The number of consecutive failed health checks required before considering an instance unhealthy.                                         | No       |                                                      |
| `grpc`                | optional(object(...)) | GRPC health check configuration. See details below.                                                                                     | No       |                                                      |
| `http`                | optional(object(...)) | HTTP health check configuration. See details below.                                                                                     | No       |                                                      |
| `http2`               | optional(object(...)) | HTTP2 health check configuration. See details below.                                                                                    | No       |                                                      |
| `https`               | optional(object(...)) | HTTPS health check configuration. See details below.                                                                                    | No       |                                                      |
| `tcp`                 | optional(object(...)) | TCP health check configuration. See details below.                                                                                      | No       |                                                      |
| `ssl`                | optional(object(...)) | SSL health check configuration. See details below.                                                                                      | No       |                                                      |

#### GRPC Health Check Configuration Object:

| Attribute               | Type                | Description                                                                                                                                                     | Required | Default |
|-------------------------|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `port`                  | optional(number)    | The port number to use for the health check.                                                                                                                      | No       |         |
| `port_name`             | optional(string)    | The port name to use for the health check.                                                                                                                      | No       |         |
| `port_specification`  | optional(string)    | Specifies how port is selected for health checking, can be one of USE_FIXED_PORT, USE_NAMED_PORT, USE_SERVING_PORT. For more details, please check the documentation | No     |          |
| `service_name`          | optional(string)    | The gRPC service name for the health check.                                                                                                                     | No       |         |

#### HTTP/HTTP2/HTTPS Health Check Configuration Object:

| Attribute               | Type                | Description                                                                                                                                                     | Required | Default |
|-------------------------|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `host`                  | optional(string)    | The host header to send in the health check request.                                                                                                         | No       |         |
| `port`                  | optional(number)    | The port number to use for the health check.                                                                                                                      | No       |         |
| `port_name`             | optional(string)    | The port name to use for the health check.                                                                                                                      | No       |         |
| `port_specification`  | optional(string)    | Specifies how port is selected for health checking, can be one of USE_FIXED_PORT, USE_NAMED_PORT, USE_SERVING_PORT. For more details, please check the documentation.    | No     |         |
| `proxy_header`          | optional(string)    | The type of proxy header to send in the health check request.   Valid values: `NONE`, `DEFAULT`.                                                               | No       |         |
| `request_path`          | optional(string)    | The request path to use for the health check.                                                                                                                   | No       |         |
| `response`              | optional(string)    | Expected HTTP/HTTPS response body content.                                                                                                                                           | No       |         |

#### TCP/SSL Health Check Configuration Object:

| Attribute               | Type                | Description                                                                                                                                                     | Required | Default |
|-------------------------|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `port`                  | optional(number)    | The port number to use for the health check.                                                                                                                      | No       |         |
| `port_name`             | optional(string)    | The port name to use for the health check.                                                                                                                      | No       |         |
| `port_specification`  | optional(string)    | Specifies how port is selected for health checking, can be one of USE_FIXED_PORT, USE_NAMED_PORT, USE_SERVING_PORT. For more details, please check the documentation.    | No     |         |
| `proxy_header`          | optional(string)    | The type of proxy header to send in the health check request.   Valid values: `NONE`, `DEFAULT`.                                                               | No       |         |
| `request`          | optional(string)    |  The content to send in the health check request.                                                                                                                   | No       |         |
| `response`              | optional(string)    | Expected TCP/SSL response content.                                                                                                                                           | No       |         |

#### Service Attachment Configuration Object:

| Attribute                       | Type                | Description                                                                                                                                | Required | Default          |
|---------------------------------|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------|
| `nat_subnets`         | list(string)    | An array of URLs where each entry is the URL of a subnet provided by the service provider to use for NAT in this service attachment.  It is advisable to only use a single subnet in a given zone to ensure single tenancy. This is required if `enable_proxy_protocol` is set to true.  | Yes  |                |
| `automatic_connection` | optional(bool, false) | If true, the service attachment is configured to automatically accept all service consumers.                                                     | No       | `false`          |
| `consumer_accept_lists` | optional(map(string), {}) | A map of allowed consumer projects that can connect to the service attachment.  Keys are the names of the allowed project and values are service account list.                                                                                                    | No       | `{}`             |
| `consumer_reject_lists`  | optional(list(string))| A list of project IDs that are not allowed to connect to this service attachment.                                                           | No       |                |
| `description`         | optional(string)    | A description of the service attachment.                                                                                                       | No       |                |
| `domain_name`         | optional(string)    | The domain name to use for the service attachment.                                                                                               | No       |                |
| `enable_proxy_protocol`| optional(bool, false) | If true, enable the proxy protocol which is required if service provider wants to know TCP client’s actual source IP address. If set to true, `nat_subnets` must be set | No    | `false`               |
| `reconcile_connections`| optional(bool) | Enables the reestablishment of connections after a service provider fails over. Only affects service providers running HAProxy version 2.6 or later. | No  |    |

## Outputs

| Name | Description |
|------|-------------|
| [backend\_service](#output_backend_service) | Backend service resource. |
| [backend\_service\_id](#output_backend_service\_id) | Backend service id. |
| [backend\_service\_self\_link](#output_backend_service\_self\_link) | Backend service self link. |
| [forwarding\_rule\_addresses](#output_forwarding_rule_addresses) | Forwarding rule addresses. |
| [forwarding\_rule\_self\_links](#output_forwarding_rule_self_links) | Forwarding rule self links. |
| [forwarding\_rules](#output_forwarding_rules) | Forwarding rule resources. |
| [group\_self\_links](#output_group\_self\_links) | Optional instance group self links. |
| [groups](#output_groups) | Optional instance group resources. |
| [health\_check](#output_health_check) | Auto-created health check resource. |
| [health\_check\_id](#output_health_check\_id) | Auto-created health check id. |
| [health\_check\_self\_link](#output_health_check\_self\_link) | Auto-created health check self link. |
| [id](#output_id) | Fully qualified forwarding rule ids. |
| [service\_attachment\_ids](#output_service_attachment_ids) | Service attachment ids. |
