## Requirements

| Name | Version |
|------|---------|
| [google](#requirement_google) | ~> 6.21 |
| [google-beta](#requirement_google-beta) | ~> 6.21 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [nlb](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-ext | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [enable\_net\_lb\_creation](variables.tf#L1) | Enables or disables the creation of the Network Load Balancer. Setting this to `false` prevents any Network Load Balancer resources from being created. | `bool` | `true` | no |
| [net-lb-ext](#input_net-lb-ext) | Configuration for External Network Load Balancer (NLB) in a map format. This input allows you to define multiple External Network Load Balancers with their backend services, forwarding rules, instance groups, and health checks. | <pre>map(object({<br/>    project_id   = string<br/>    region       = string<br/>    name         = string<br/>    description  = optional(string)<br/>    health_check = optional(string, null)<br/>    labels       = map(string)<br/>    backend_service_config = optional(object({<br/>      connection_draining_timeout_sec = optional(number)<br/>      connection_tracking = optional(object({<br/>        idle_timeout_sec          = optional(number)<br/>        persist_conn_on_unhealthy = optional(string)<br/>        track_per_session         = optional(bool)<br/>      }))<br/>      failover_config = optional(object({<br/>        disable_conn_drain        = optional(bool)<br/>        drop_traffic_if_unhealthy = optional(bool)<br/>        ratio                     = optional(number)<br/>      }))<br/>      locality_lb_policy = optional(string)<br/>      name               = optional(string)<br/>      port_name          = optional(string)<br/>      log_sample_rate    = optional(number)<br/>      protocol           = optional(string, "UNSPECIFIED")<br/>      session_affinity   = optional(string)<br/>      timeout_sec        = optional(number)<br/>    }), {})<br/><br/>    backends = list(object({<br/>      group       = string<br/>      description = optional(string, "Terraform managed.")<br/>      failover    = optional(bool, false)<br/>    }))<br/><br/>    forwarding_rules_config = optional(map(object({<br/>      address     = optional(string)<br/>      description = optional(string)<br/>      ipv6        = optional(bool, false)<br/>      name        = optional(string)<br/>      ports       = optional(list(string), null)<br/>      protocol    = optional(string, "TCP")<br/>      subnetwork  = optional(string) # Required for IPv6<br/>    })), {})<br/><br/>    group_configs = optional(map(object({<br/>      zone        = string<br/>      instances   = optional(list(string))<br/>      named_ports = optional(map(number), {})<br/>    })), {})<br/><br/>    health_check_config = optional(object({<br/>      check_interval_sec  = optional(number)<br/>      description         = optional(string, "Terraform managed.")<br/>      enable_logging      = optional(bool, false)<br/>      healthy_threshold   = optional(number)<br/>      name                = optional(string)<br/>      timeout_sec         = optional(number)<br/>      unhealthy_threshold = optional(number)<br/>      grpc = optional(object({<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        service_name       = optional(string)<br/>      }))<br/>      http = optional(object({<br/>        host               = optional(string)<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request_path       = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      http2 = optional(object({<br/>        host               = optional(string)<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request_path       = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      https = optional(object({<br/>        host               = optional(string)<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request_path       = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      tcp = optional(object({<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request            = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      ssl = optional(object({<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request            = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>    }))<br/>  }))</pre> | n/a | yes |

<a name="input_enable_net_lb_creation"></a>

### `enable_net_lb_creation` Details:

This boolean variable controls whether the Network Load Balancer is created.  Set to `false` to prevent the creation of any resources associated with the NLB. This can be useful for conditional deployments or disabling the load balancer in certain environments.

<a name="input_net-lb-ext"></a>

### `net-lb-ext` Details:

This input variable is a map where each key represents a unique identifier for an External Network Load Balancer. The value associated with each key is an object defining the NLB's configuration.

#### NLB Configuration Object:

| Attribute                     | Type                        | Description                                                                                                                                                                                                | Required | Default                    |
|-------------------------------|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------------------------|
| `project_id`                  | string                      | The ID of the Google Cloud project where the NLB will be created. Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                                  | Yes      |                            |
| `region`                      | string                      | The region where the NLB will be created. Example: `"us-central1"`.                                                                                                                                          | Yes      |                            |
| `name`                        | string                      | The name of the NLB. This name must be unique within the region and project. Example: `"my-nlb"`.                                                                                                       | Yes      |                            |
| `description`                 | optional(string)            | A text description of the NLB.                                                                                                                                                                           | No       |                            |
| `health_check`                | optional(string, null)      | The self-link of an existing health check to use with this NLB. If set to `null`, it relies on `health_check_config` to create an auto-generated health check. This attribute will conflict with `health_check_config`. | No       | `null`                     |
| `labels`                      | map(string)                 | A map of labels to apply to the NLB. Labels can be used for organization, filtering, and cost tracking. Example: `{"environment" = "production", "team" = "platform"}`.                                | Yes      |                            |
| `backend_service_config`      | optional(object(...), {})   | Configuration for the backend service associated with the NLB. See "Backend Service Configuration Object" below for details.                                                                            | No       | `{}`                       |
| `backends`                    | list(object(...))            | A list of backend instance groups to be added to the backend service. See "Backend Object" below for details.                                                                                             | Yes      |                            |
| `forwarding_rules_config`     | optional(map(object(...)), {}) | A map defining forwarding rules for the NLB. Each key is a unique identifier for the rule. See "Forwarding Rule Configuration Object" below for details. | No       | `{}`                       |
| `group_configs`               | optional(map(object(...)), {}) | A map defining instance group configurations. This is used if creating the instance group here, rather than referencing an existing one. Each key is a unique identifier for the group. See "Group Configuration Object" below for details. | No       | `{}`                       |
| `health_check_config`         | optional(object(...), {})   | Configuration for the health check associated with the backend service. See "Health Check Configuration Object" below for details. | No       | `{}`                       |

#### Backend Service Configuration Object:

| Attribute                             | Type                        | Description                                                                                                                                                                                                  | Required | Default         |
|---------------------------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------|
| `connection_draining_timeout_sec`     | optional(number)            | The amount of time (in seconds) for which connections to a removed backend will remain open.                                                                                                                | No       |                 |
| `connection_tracking` | optional(object(...))           | Configures connection tracking policy for the backend service. For more details, please check the documentation.                                                                         | No       |                 |
| `failover_config`         | optional(object(...))         | Configuration for failover settings for the backend service.  See "Failover Configuration Object" below for details.                                            | No       |        |
| `locality_lb_policy`      | optional(string)            | The load balancing algorithm used within the zone. Valid values are:  `"ROUND_ROBIN"`, `"LEAST_CONNECTION"`, `"RING_HASH"`, `"RANDOM"`, `"MAGLEV"`, `"ORIGINAL_DESTINATION_IP"`, `"TARGETED"`. | No       |                 |
| `name`                                | optional(string)            | The name of the backend service. If not provided a name will be generated.                                                                                                  | No       |                 |
| `port_name`                           | optional(string)            | The name of a service that has been added to an instance group.                                                                                                            | No       |                 |
| `log_sample_rate`                     | optional(number)            | The percentage of traffic for which logging is enabled. Must be between 0.0 and 1.0.                                                                                     | No       |                 |
| `protocol`                            | optional(string, "UNSPECIFIED") | The protocol used for traffic between the load balancer and the backend instances. Valid values are `"TCP"`, `"UDP"`, `"TCP_UDP"`, and `"UNSPECIFIED"`.                                                    | No       | `"UNSPECIFIED"` |
| `session_affinity`                    | optional(string)            | The session affinity setting for the backend service.  Valid values are `"NONE"`, `"CLIENT_IP"`, `"CLIENT_IP_PROTO"`, and `"CLIENT_IP_PORT_PROTO"`.                                                           | No       |                 |
| `timeout_sec`                         | optional(number)            | The amount of time (in seconds) that the load balancer will wait for a backend to respond before failing the request.                                                                                   | No       |                 |

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
| `group`     | string   | The self-link of the instance group that will serve as the backend. Must be a valid instance group. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/zones/us-central1-a/instanceGroups/my-instance-group"`. | Yes      |                         |
| `description`| optional(string, "Terraform managed.")  | A text description of the Backend. | No  | `"Terraform managed."`                         |
| `failover`| optional(bool, false)  | Used for failover scenario. If `true` it means that this group represents the `failover` group. See failover configuration for further details. | No  |   `false`                      |

#### Forwarding Rule Configuration Object:

| Attribute       | Type                | Description                                                                                                                                                                                  | Required | Default        |
|-----------------|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------------|
| `address`       | optional(string)    | The IP address that the forwarding rule will use. If not provided, an ephemeral external IP address will be assigned.                                                                      | No       |                |
| `description`   | optional(string)    | A description of the forwarding rule.                                                                                                                                                        | No       |                |
| `ipv6`          | optional(bool, false)  | If set to `true`, the forwarding rule will use IPv6. This requires that the VPC and subnetwork have IPv6 enabled. | No       | `false`              |
| `name`          | optional(string)    | The name of the forwarding rule. If not provided a name will be generated.                                                                                                        | No       |                |
| `ports`         | optional(list(string), null) | A list of ports that the forwarding rule will listen on. Specify port numbers or port ranges. Example: `["80", "443", "1000-2000"]`. If null/empty, all ports are forwarded.                      | No       | `null`           |
| `protocol`      | optional(string, "TCP")  | The protocol that the forwarding rule will use. Valid values are `"TCP"`, `"UDP"`, and `"TCP_UDP"`.   | No       |`"TCP"`          |
| `subnetwork`      | optional(string) | Required if `ipv6` is enabled. The self-link of the subnetwork used by the forwarding rule for IPv6 traffic.  Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/regions/us-central1/subnetworks/my-subnet"`.                                                                                               | No |         |

#### Group Configuration Object:

| Attribute     | Type                | Description                                                                                                                                | Required | Default                 |
|---------------|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------------|
| `zone`        | string              | The zone where the instance group will be created. Example: `"us-central1-a"`.                                                       | Yes      |                         |
| `instances`   | optional(list(string)) | A list of instance self-links to add to the group. If not specified, it is possible to add instances in the future using separate resources or tools. | No       |                         |
| `named_ports` | optional(map(number), {}) | A map of named ports to configure on the instance group. Keys are port names and values are port numbers. Example: `{"http" = 80, "https" = 443}`.           | No       | `{}`                       |

#### Health Check Configuration Object:

| Attribute             | Type                | Description                                                                                                                                  | Required | Default                                              |
|-----------------------|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------------------------------------------|
| `check_interval_sec`  | optional(number)    | How often (in seconds) to send a health check.                                                                                             | No       |                                                      |
| `description`         | optional(string, "Terraform managed.") | A text description of the Health Check.                                                                                                  | No       | `"Terraform managed."`                        |
| `enable_logging`      | optional(bool, false) | Indicates whether or not to log the results of the health check.                                                                         | No       | `false`                                              |
| `healthy_threshold`   | optional(number)    | The number of consecutive successful health checks required before considering an instance healthy.                                           | No       |                                                      |
| `timeout_sec`         | optional(number)    | How long (in seconds) to wait for a response from the instance.                                                                          | No       |                                                      |
| `unhealthy_threshold` | optional(number)    | The number of consecutive failed health checks required before considering an instance unhealthy.                                         | No       |                                                      |
| `grpc`                | optional(object(...)) | GRPC health check configuration. See details below.                                                                                     | No       |                                                      |
| `http`                | optional(object(...)) | HTTP health check configuration. See details below.                                                                                     | No       |                                                      |
| `http2`               | optional(object(...)) | HTTP2 health check configuration. See details below.                                                                                    | No       |                                                      |
| `https`               | optional(object(...)) | HTTPS health check configuration. See details below.                                                                                    | No       |                                                      |
| `tcp`                 | optional(object(...)) | TCP health check configuration. See details below.                                                                                      | No       |                                                      |
| `ssl`                 | optional(object(...)) | SSL health check configuration. See details below.                                                                                      | No       |                                                      |

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

#### List of Backend Descriptions
* backends[].group

Each member represents a backend that consists of one instance group.

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| group | string |URL to the instance group. All backend instance groups must satisfy the constraint that their combined number of instances must not exceed the target virtual machine count as defined for the network that the load balancer belongs to. |yes||
| description | string | An optional description of this resource. | no | `Terraform managed.` |
| failover | bool | If true, the instances in the backend do not handle normal traffic. The primary purpose of these instances is to failover when all the other backends are unavailable. | no | `false` |

#### Forwarding Rule Description

Each member represents a forwarding rule.

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| address | string | The IP address that will be assigned to the forwarding rule; range: TOS *\/30* || The regional external IP address in the project that is being created or used.  If a reserved IP address is not specified, then an ephemeral IP address is used. The IP address needs to be in the same region as the external forwarding rule. |No| |
| description | string | An optional description for this resource. | no |  |
| ipv6 | bool | Specifies whether the load balancer is accessible via IPv6. A value of true will create the rule using an IPv6 address. In order for the load balancer to use an IPv6 address, the following conditions must be met: The network in which the load balancer is being created or used must have been created with the stack type set to IPv4 and IPv6. For instance, the subnet IPv6 traffic must be set to on. Each backend instance or network endpoint must have been configured for IPv6 traffic. | No | `false` |
| name | string | Name of the Forwarding Rule.  Value must be RFC1035 compliant. | No |   |
| ports | list(string) | A list of ports that will be used for the forwarding rule. Value must be a list of string of valid ports numbers; range *0-65535*. If this is set, protocol must be defined. If set to null, all ports are matched. | no |`null`|
| protocol | string |  The IP protocol to assign this rule. Valid options are *TCP, UDP, ESP, SCTP, ICMP*. For *TCP* protocol, ports must be defined. Setting protocol to  _TCP_UDP_ is not allowed for external load balancer.. If a protocol is not specified; the default is _TCP_. | no | `TCP` |
| subnetwork | string |  If `ipv6 = true`, a subnetwork must be specified. This is the subnetwork that the IPv6 forwarding rule will be created in.  |no| |

#### List of the possible group description

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| description | string | Optional description which can be set | no |`Terraform managed.`|
| instances | list(string) | A list with instances. Each member represents the compute instance url to add to the instance group. |no||
| named_ports | map(number) | The named port and values for the group. Each member represents a value for each port. Example - _http:80_. More info can be found here - (https://cloud.google.com/compute/docs/instance-groups/#specifying_a_named_port_on_an_instance_group) | no | - |
| zone | string | Zone where the instance group needs to be crated | yes | - |

#### Health Check Configuration Object:

| Attribute             | Type                | Description                                                                                                                                  | Required | Default                                              |
|-----------------------|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------------------------------------------|
| `check_interval_sec`  | optional(number)    | How often (in seconds) to send a health check.                                                                                             | No       |                                                      |
| `description`         | optional(string, "Terraform managed.") | A text description of the Health Check.                                                                                                  | No       | `"Terraform managed."`                        |
| `enable_logging`      | optional(bool, false) | Indicates whether or not to log the results of the health check.                                                                         | No       | `false`                                              |
| `healthy_threshold`   | optional(number)    | The number of consecutive successful health checks required before considering an instance healthy.                                           | No       |                                                      |
| `timeout_sec`         | optional(number)    | How long (in seconds) to wait for a response from the instance.                                                                          | No       |                                                      |
| `unhealthy_threshold` | optional(number)    | The number of consecutive failed health checks required before considering an instance unhealthy.                                         | No       |                                                      |
| `grpc`                | optional(object(...)) | GRPC health check configuration. See details below.                                                                                     | No       |                                                      |
| `http`                | optional(object(...)) | HTTP health check configuration. See details below.                                                                                     | No       |                                                      |
| `http2`               | optional(object(...)) | HTTP2 health check configuration. See details below.                                                                                    | No       |                                                      |
| `https`               | optional(object(...)) | HTTPS health check configuration. See details below.                                                                                    | No       |                                                      |
| `tcp`                 | optional(object(...)) | TCP health check configuration. See details below.                                                                                      | No       |                                                      |
| `ssl`                 | optional(object(...)) | SSL health check configuration. See details below.                                                                                      | No       |                                                      |

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

In order to deploy the following resources you will need to set the following permissions at your service account:
* compute.backendServices.create
* compute.firewalls.create
* compute.forwardingRules.create
* compute.healthChecks.create
* compute.instanceGroups.create
* compute.networks.use
* compute.networks.useExternalIpAddresses
* compute.regionBackendServices.create
* compute.subnetworks.use
* compute.subnetworks.useExternalIpAddresses

A role example that contains all of them is:
* roles/compute.networkAdmin
