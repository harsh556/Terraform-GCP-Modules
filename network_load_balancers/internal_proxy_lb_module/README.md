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
| [net\_lb\_proxy\_int](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-proxy-int | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [net\_lb\_proxy\_int\_config](variable.tf#L1) | Configuration for Internal Load Balancer (ILB) in a map format. This input allows you to define multiple Internal HTTP(S) Load Balancers, including backend services, forwarding rules, instance groups, network endpoint groups (NEGs), and health checks. | <pre>map(object({<br/>  <br/>    project_id = string<br/>    region     = string<br/>    name       = string<br/>    vpc_config = object({<br/>      network    = string<br/>      subnetwork = string<br/>    })<br/><br/>    # Optional Variables<br/>    description     = optional(string, "Terraform managed.")<br/>    address         = optional(string)<br/>    global_access   = optional(bool)<br/>    backend_service_config = optional(object({<br/>      affinity_cookie_ttl_sec         = optional(number)<br/>      connection_draining_timeout_sec = optional(number)<br/>      health_checks                   = optional(list(string), ["default"])<br/>      log_sample_rate                 = optional(number)<br/>      port_name                       = optional(string)<br/>      session_affinity                = optional(string, "NONE")<br/>      timeout_sec                     = optional(number)<br/>      backends = optional(list(object({<br/>        group           = string<br/>        balancing_mode  = optional(string, "UTILIZATION")<br/>        capacity_scaler = optional(number, 1)<br/>        description     = optional(string, "Terraform managed.")<br/>        failover        = optional(bool, false)<br/>        max_connections = optional(object({<br/>          per_endpoint = optional(number)<br/>          per_group    = optional(number)<br/>          per_instance = optional(number)<br/>        }))<br/>        max_utilization = optional(number)<br/>      })))<br/>      connection_tracking = optional(object({<br/>        idle_timeout_sec          = optional(number)<br/>        persist_conn_on_unhealthy = optional(string)<br/>        track_per_session         = optional(bool)<br/>      }))<br/>      failover_config = optional(object({<br/>        disable_conn_drain        = optional(bool)<br/>        drop_traffic_if_unhealthy = optional(bool)<br/>        ratio                     = optional(number)<br/>      }))<br/>    }), {})<br/>    group_configs = optional(map(object({<br/>      zone        = string<br/>      instances   = optional(list(string))<br/>      named_ports = optional(map(number), {})<br/>      project_id  = optional(string)<br/>    })), {})<br/>    health_check        = optional(string)<br/>    health_check_config = optional(object({<br/>      check_interval_sec  = optional(number)<br/>      description         = optional(string, "Terraform managed.")<br/>      enable_logging      = optional(bool, false)<br/>      healthy_threshold   = optional(number)<br/>      timeout_sec         = optional(number)<br/>      unhealthy_threshold = optional(number)<br/>      grpc = optional(object({<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        service_name       = optional(string)<br/>      }))<br/>      http = optional(object({<br/>        host               = optional(string)<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request_path       = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      http2 = optional(object({<br/>        host               = optional(string)<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request_path       = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      https = optional(object({<br/>        host               = optional(string)<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request_path       = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      tcp = optional(object({<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request            = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>      ssl = optional(object({<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string) # USE_FIXED_PORT USE_NAMED_PORT USE_SERVING_PORT<br/>        proxy_header       = optional(string)<br/>        request            = optional(string)<br/>        response           = optional(string)<br/>      }))<br/>    }), {})<br/>    labels = optional(map(string), {})<br/>    neg_configs = optional(map(object({<br/>      project_id = optional(string)<br/>      gce = optional(object({<br/>        zone        = string<br/>        network     = optional(string)<br/>        subnetwork  = optional(string)<br/>        endpoints   = optional(map(object({<br/>          instance   = string<br/>          ip_address = string<br/>          port       = number<br/>        })))<br/>      }))<br/>      hybrid = optional(object({<br/>        zone        = string<br/>        network     = optional(string)<br/>        endpoints   = optional(map(object({<br/>          ip_address = string<br/>          port       = number<br/>        })))<br/>      }))<br/>      internet = optional(object({<br/>        region      = string<br/>        use_fqdn    = optional(bool, true)<br/>        endpoints   = optional(map(object({<br/>          destination = string<br/>          port        = number<br/>        })))<br/>      }))<br/>      psc = optional(object({<br/>        region         = string<br/>        target_service = string<br/>        network        = optional(string)<br/>        subnetwork     = optional(string)<br/>      }))<br/>    })), {})<br/>    port = optional(number, 80)<br/>    service_attachment = optional(object({<br/>      nat_subnets           = list(string)<br/>      automatic_connection  = optional(bool, false)<br/>      consumer_accept_lists = optional(map(string), {})<br/>      consumer_reject_lists = optional(list(string))<br/>      description           = optional(string)<br/>      domain_name           = optional(string)<br/>      enable_proxy_protocol = optional(bool, false)<br/>      reconcile_connections = optional(bool)<br/>    }),null)<br/>  }))</pre> | n/a | yes |

<a name="input_net_lb_proxy_int_config"></a>

### `net_lb_proxy_int_config` Details:

This input variable is a map where each key represents a unique identifier for an Internal HTTP(S) Load Balancer (Proxy-based ILB). The value associated with each key is an object defining the ILB's configuration.

#### ILB Configuration Object:

| Attribute                     | Type                        | Description                                                                                                                                                                                                                   | Required | Default                    |
|-------------------------------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------------------------|
| `project_id`                  | string                      | The ID of the Google Cloud project where the ILB will be created.  Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                                                                   | Yes      |                            |
| `region`                      | string                      | The region where the ILB will be created. Example: `"us-central1"`.                                                                                                                                                           | Yes      |                            |
| `name`                        | string                      | The name of the ILB. This name must be unique within the region and project. Example: `"my-ilb"`.                                                                                                                          | Yes      |                            |
| `vpc_config`                  | object(...)                 | Configuration for the VPC network and subnetwork used by the ILB. See "VPC Configuration Object" below for details.                                                                                                         | Yes      |                            |
| `description`                 | optional(string, "Terraform managed.") | A text description of the ILB.                                                                                                                                                                                 | No       | `"Terraform managed."`     |
| `address`                     | optional(string)            | The IP address that the forwarding rule will use. If not provided, an ephemeral internal IP address will be assigned.                                                                                                    | No       |                            |
| `global_access`               | optional(bool)              | If set to `true`, connections can be routed to the ILB from any region. If set to `false`, connections are restricted to the ILB's region.                                                                                | No       |                            |
| `backend_service_config`      | optional(object(...), {})   | Configuration for the backend service associated with the ILB.  See "Backend Service Configuration Object" below for details.                                                                                                | No       | `{}`                       |
| `group_configs`               | optional(map(object(...)), {}) | A map defining instance group configurations. This is used if creating the instance group here, rather than referencing an existing one. Each key is a unique identifier for the group. See "Group Configuration Object" below for details. | No       | `{}`                       |
| `health_check`                | optional(string)            | The self_link of existing health check to use with this ILB. If not set, health_check_config must be used to create a new one. | No      |       |
| `health_check_config`         | optional(object(...), {})   | Configuration for the health check associated with the backend service.  See "Health Check Configuration Object" below for details. If `null`, a default health check is created.                                           | No       | `{}`                       |
| `labels`                      | optional(map(string), {})   | A map of labels to apply to the ILB. Labels can be used for organization, filtering, and cost tracking.  Example: `{"environment" = "production", "team" = "platform"}`.                                                 | No       | `{}`                       |
| `neg_configs`                 | optional(map(object(...)), {}) | A map defining network endpoint group (NEG) configurations. This configuration is used to point traffic to specified endpoints.                                                           | No      | `{}` |
| `port`                        | optional(number, 80)        | The port that the forwarding rule will listen on. Defaults to port 80. This applies to HTTP(S) proxy load balancers and is the port the proxy will listen on.                                           | No       | `80`                       |
| `service_attachment`    | optional(object(...))     | A single config object to enable Service Attachment functionality for this LB. See “Service Attachment Object” below for details       | No       | `null`   |

#### VPC Configuration Object:

| Attribute   | Type     | Description                                                                                                                                                                    | Required | Default |
|-------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `network`   | string   | The self-link of the VPC network used by the ILB. Must be a valid VPC network. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/global/networks/my-vpc"`. | Yes      |         |
| `subnetwork`| string   | The self-link of the subnetwork used by the ILB. Must be a valid subnetwork within the same region as the ILB. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/regions/us-central1/subnetworks/my-subnet"`. | Yes      |         |

#### Backend Service Configuration Object:

| Attribute                             | Type                        | Description                                                                                                                                                              | Required | Default         |
|---------------------------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------|
| `affinity_cookie_ttl_sec`             | optional(number)            | Lifetime of cookies in seconds. Only applicable if `session_affinity` is set to `"GENERATED_COOKIE"`.                                                                   | No       |                 |
| `connection_draining_timeout_sec`     | optional(number)            | The amount of time (in seconds) for which connections to a removed backend will remain open.                                                                         | No       |                 |
| `health_checks`                   | optional(list(string), ["default"]) | A list of health check self-links for the backend service. If "default" is specified, a default health check will be created. | No       | `["default"]`          |
| `log_sample_rate`                     | optional(number)            | The percentage of traffic for which logging is enabled. Must be between 0.0 and 1.0.                                                                                 | No       |                 |
| `port_name`                       | optional(string)            | The name of a service that has been added to an instance group.                                                                         | No       |                 |
| `session_affinity`                    | optional(string, "NONE")   | The session affinity setting for the backend service. Valid values are `"NONE"`, `"CLIENT_IP"`, `"GENERATED_COOKIE"`, `"CLIENT_IP_PROTO"`, and `"CLIENT_IP_PORT_PROTO"`. | No       | `"NONE"`         |
| `timeout_sec`                         | optional(number)            | The amount of time (in seconds) that the load balancer will wait for a backend to respond before failing the request.                                                | No       |                 |
| `backends`                            | optional(list(object(...))) | A list of backend instance groups to be added to the backend service.  See "Backend Object" below for details.  If `null`, no backends are added initially.                                       | No      |                |
| `connection_tracking` | optional(object(...))           | Configures connection tracking policy for the backend service. For more details, please check the documentation.                                                                         | No       |                 |
| `failover_config`         | optional(object(...))         | Configuration for failover settings for the backend service.  See "Failover Configuration Object" below for details.  **NOTE** Proxy ILBs do not support failover.      | No       |        |

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

| Attribute             | Type                        | Description                                                                                                                                                                             | Required | Default         |
|-----------------------|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------|
| `group`               | string                      | The self-link of the instance group or network endpoint group (NEG) that will serve as the backend.  Must be a valid instance group or NEG. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/zones/us-central1-a/instanceGroups/my-instance-group"`. | Yes      |                         |
| `balancing_mode`      | optional(string, "UTILIZATION") | The balancing mode used when sending traffic to the backend.  Valid values are `"UTILIZATION"`, `"CONNECTION"`, and `"RATE"`.                                                                    | No       | `"UTILIZATION"` |
| `capacity_scaler`     | optional(number, 1)         | A multiplier applied to the group's maximum connections, maximum rate, or maximum utilization, depending on the `balancing_mode`.                                                                 | No       | `1`             |
| `description`         | optional(string, "Terraform managed.") | A text description of the Backend.                                                                                                                                                    | No       | `"Terraform managed."` |
| `failover`            | optional(bool, false)         | Used for failover scenario. If `true` it means that this group represents the `failover` group. See failover configuration for further details.                                                     | No       | `false`          |
| `max_connections`     | optional(object(...))         | Maximum number of connections to the backend. Requires `balancing_mode = "CONNECTION"`.  See "Max Connections Object" below for details.                                                            | No       |                 |
| `max_utilization`     | optional(number)            | Maximum backend utilization (0.0 to 1.0).  Requires `balancing_mode = "UTILIZATION"`.                                                                                                        | No       |                 |

#### Max Connections Object:

| Attribute       | Type     | Description                                                                                                                                     | Required | Default |
|-----------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `per_endpoint`| optional(number) | The maximum number of connections that an individual endpoint can handle.       | No       |         |
| `per_group`    | optional(number) | The maximum number of connections that the group can handle.      | No       |         |
| `per_instance`  | optional(number) | The maximum number of connections that an instance can handle.  If this attribute is defined it would override per_endpoint.      | No       |         |

#### Group Configuration Object:

| Attribute     | Type                | Description                                                                                                                                | Required | Default |
|---------------|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `zone`        | string              | The zone where the instance group will be created.  Example: `"us-central1-a"`.                                                       | Yes      |         |
| `instances`   | optional(list(string)) | A list of instance self-links to add to the group. If not specified, it is possible to add instances in the future using separate resources or tools. | No       |         |
| `named_ports` | optional(map(number), {}) | A map of named ports to configure on the instance group. Keys are port names and values are port numbers. Example: `{"http" = 80, "https" = 443}`.           | No       | `{}`                       |
| `project_id`  | optional(string)    | The project id where the instance group resides. This is useful in shared VPC configurations if instance groups are in a different project.  If not supplied, the project_id is taken from higher level map, where project is deployed.           | No       |         |

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

#### Network Endpoint Group (NEG) Configuration Objects:

There are different NEG types, such as gce, hybrid, internet, and psc.
Each NEG type will have its own set of configuration settings.
##### GCE Configuration Object:

| Attribute     | Type         | Description                                                                                                                                 | Required | Default |
|---------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `zone`        | string       | The zone where the NEG will be created. Example: `"us-central1-a"`.                                                                       | Yes      |         |
| `network`     | optional(string) | The self-link of the network used by NEG. The default is the service network.        | No  |         |
| `subnetwork`  | optional(string) | The self-link of the subnetwork used by NEG. The default is the service subnetwork.        | No   |      |
| `endpoints`   | optional(map(object(...))) | A map of endpoints to create in the NEG. See details below.        | No    |       |
##### Hybrid Configuration Object:

| Attribute     | Type         | Description                                                                                                                                 | Required | Default |
|---------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `zone`        | string       | The zone where the NEG will be created. Example: `"us-central1-a"`.                                                                       | Yes      |         |
| `network`     | optional(string) | The self-link of the network used by NEG. The default is the service network.        | No  |         |
| `endpoints`  | optional(map(object(...))) | A map of endpoints to create in the NEG. See details below.        | No    |       |

##### Internet Configuration Object:

| Attribute     | Type         | Description                                                                                                                                 | Required | Default |
|---------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `region`      | string       | The region where the NEG will be created.  Example: `"us-central1-a"`.                                                                       | Yes      |         |
| `use_fqdn`    | optional(bool, true) | If true, the FQDN (Fully Qualified Domain Name) is used as the endpoint. | No      |   `true`       |
| `endpoints`  | optional(map(object(...))) | A map of endpoints to create in the NEG. See details below.        | No    |       |

##### PSC Configuration Object:

| Attribute     | Type         | Description                                                                                                                                 | Required | Default |
|---------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `region`      | string       | The region where the NEG will be created.  Example: `"us-central1-a"`.                                                                       | Yes      |         |
| `target_service` | string       | The URL of the target service that provides the Service Connect endpoint.  Example: `"projects/my-project/regions/us-central1/serviceAttachments/my-service-attachment"`        | Yes      |         |
| `network`     | optional(string) | The self-link of the network used by NEG. The default is the service network.        | No  |         |
| `subnetwork`  | optional(string) | The self-link of the subnetwork used by NEG. The default is the service subnetwork.        | No   |      |

##### Endpoint Configuration Object:
This applies to gce, hybrid and internet NEGs
| Attribute     | Type         | Description                                                                                                                                 | Required | Default |
|---------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `instance`  | string | The name of the instance group or instance. Required with gce NEG type, example: `"instance-01"`| Only when used with GCE NEG, others should use ip_address or destination attribute  |         |
| `ip_address` | string       | The IP address of the endpoint. Required with hybrid NEG type, example: `"10.0.0.1"`                                                                   | Only when used with Hybrid NEG, others should use instance or destination attribute    |          |
| `destination`        | string | The FQDN of the endpoint, must set `use_fqdn = true` from `internet` configuration object. Required with internet NEG type, example: `"test.example.com"` | Only when used with Internet NEG, others should use instance or ip_address attribute     |      |
| `port`        | number  | Port number of the endpoint, example: 8080                                                                      | Yes  |      |

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
| [address](#output_address) | Forwarding rule address. |
| [backend\_service](#output_backend_service) | Backend service resource. |
| [backend\_service\_id](#output_backend_service\_id) | Backend service id. |
| [backend\_service\_self\_link](#output_backend_service\_self\_link) | Backend service self link. |
| [forwarding\_rule](#output_forwarding_rule) | Forwarding rule resource. |
| [group\_self\_links](#output_group\_self\_links) | Optional instance group self links. |
| [groups](#output_groups) | Optional instance group resources. |
| [health\_check](#output_health\_check) | Auto-created health check resource. |
| [health\_check\_id](#output_health\_check\_id) | Auto-created health check id. |
