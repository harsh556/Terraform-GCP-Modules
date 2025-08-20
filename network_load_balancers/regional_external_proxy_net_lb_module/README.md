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
| [tcp\_proxy\_lb](main.tf#L1) | github.com/terraform-google-modules/terraform-google-lb/modules/regional_proxy_lb | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [tcp\_proxy\_lb\_config](variables.tf#L1) | Configuration for External TCP Proxy Load Balancer in a map format. This input allows you to define multiple regional External TCP Proxy Load Balancers with their backends (instance groups or network endpoint groups), health checks, and forwarding rules. | <pre>map(object({<br/>    <br/>    name           = string<br/>    project        = string<br/>    region         = string<br/>    network        = string<br/>    port_front_end = number<br/>    backend = object({<br/>      port             = optional(number)<br/>      port_name        = optional(string)<br/>      description      = optional(string)<br/>      backend_type     = string # INSTANCE_GROUP, NETWORK_ENDPOINT_GROUP<br/>      session_affinity = optional(string)<br/>      timeout_sec      = optional(number)<br/>      log_config = object({<br/>        enable      = optional(bool)<br/>        sample_rate = optional(number)<br/>      })<br/>      groups = list(object({<br/>        group                       = string<br/>        balancing_mode              = optional(string)<br/>        capacity_scaler             = optional(number)<br/>        description                 = optional(string)<br/>        max_connections             = optional(number)<br/>        max_connections_per_instance = optional(number)<br/>        max_connections_per_endpoint = optional(number)<br/>        max_rate                    = optional(number)<br/>        max_rate_per_instance        = optional(number)<br/>        max_rate_per_endpoint        = optional(number)<br/>        max_utilization             = optional(number)<br/>      }))<br/>    })<br/>    health_check = object({<br/>      check_interval_sec  = optional(number)<br/>      healthy_threshold   = optional(number)<br/>      timeout_sec         = optional(number)<br/>      unhealthy_threshold = optional(number)<br/>      tcp_health_check = object({<br/>        request            = optional(string)<br/>        response           = optional(string)<br/>        port               = optional(number)<br/>        port_name          = optional(string)<br/>        port_specification = optional(string)<br/>        proxy_header       = optional(string)<br/>      })<br/>    })<br/><br/>    # Optional Variables<br/>    network_project          = optional(string)<br/>    create_firewall_rules    = optional(bool, false)<br/>    target_tags              = optional(list(string), [])<br/>    address                  = optional(string)<br/>    create_proxy_only_subnet = optional(bool, false)<br/>    proxy_only_subnet_cidr   = optional(string)<br/>    proxy_header             = optional(string, "NONE")<br/>  }))</pre> | n/a |

<a name="input_tcp_proxy_lb_config"></a>

### `tcp_proxy_lb_config` Details:

This input variable is a map where each key represents a unique identifier for an External TCP Proxy Load Balancer. The value associated with each key is an object defining the NLB's configuration.

#### TCP Proxy LB Configuration Object:

| Attribute             | Type                        | Description                                                                                                                                                                                        | Required | Default                    |
|-----------------------|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------------------------|
| `name`                | string                      | The name of the TCP Proxy Load Balancer. This name must be unique within the project and region.  Example: `"my-tcp-proxy-lb"`.                                                                  | Yes      |                            |
| `project`             | string                      | The ID of the Google Cloud project where the TCP Proxy Load Balancer will be created.  Must be a valid Google Cloud project ID. Example: `"my-project-123"`.                                        | Yes      |                            |
| `region`              | string                      | The region where the TCP Proxy Load Balancer will be created. Example: `"us-central1"`.                                                                                                             | Yes      |                            |
| `network`             | string                      | The self-link of the VPC network used by the load balancer. Must be a valid VPC network. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/global/networks/my-vpc"`.       | Yes      |                            |
| `port_front_end`      | number                      | The port that the forwarding rule will listen on for incoming traffic. Must be a valid port number (1-65535).                                                                                   | Yes      |                            |
| `backend`             | object(...)                 | Configuration for the backend service. See "Backend Configuration Object" below for details.                                                                                                     | Yes      |                            |
| `health_check`        | object(...)                 | Configuration for the health check. See "Health Check Configuration Object" below for details.                                                                                                  | Yes      |                            |
| `network_project`       | optional(string)            | The project where the shared VPC resides. Will default to `project` if left blank.                                                                                                               | No       |                            |
| `create_firewall_rules` | optional(bool, false)       | Determines whether to create firewall rules to allow traffic to the backend instances/NEGs. If set to `true`, the module will create necessary firewall rules. Set to `false` if you are managing firewall rules separately.| No       | `false`                    |
| `target_tags`           | optional(list(string), [])   | A list of target tags to apply to the created firewall rules, if `create_firewall_rules` is set to `true`.                                                                                     | No       | `[]`                       |
| `address`               | optional(string)            | The IP address that the forwarding rule will use. If not provided, an ephemeral external IP address will be assigned.                                                                      | No       |                            |
| `create_proxy_only_subnet`  | optional(bool, false)    | Used for Proxy Only Subnet feature. If set to `true`, the module will create a proxy-only subnet.                                                                                               | No       | `false`                   |
| `proxy_only_subnet_cidr`    | optional(string)            | Used for Proxy Only Subnet feature. The CIDR range for the proxy-only subnet, required if `create_proxy_only_subnet` is set to `true`.                                                                 | No       |                            |
| `proxy_header`             | optional(string, "NONE")            | Specifies the type of proxy header to use. Valid values are `"NONE"`, `"DEFAULT"`, and `"CUSTOM"`.  Used with health checks.                                                             | No       | `"NONE"`                   |

#### Backend Configuration Object:

| Attribute             | Type                        | Description                                                                                                                                                                   | Required | Default |
|-----------------------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `port`                | optional(number)            | The port that the backend service uses to connect to the backend instances/NEGs.   If not specified, the health check port is used.                                             | No       |         |
| `port_name`           | optional(string)            | The name of a service that has been added to an instance group or NEG.                                                                                                         | No       |         |
| `description`         | optional(string)            | A text description of the backend service.                                                                                                                                    | No       |         |
| `backend_type`        | string                      | The type of backend. Valid values are `"INSTANCE_GROUP"` or `"NETWORK_ENDPOINT_GROUP"`. Specifies the type of the backends being used.                                      | Yes      |         |
| `session_affinity`    | optional(string)            | The session affinity setting for the backend service. Valid values are `"NONE"`, `"CLIENT_IP"`, `"CLIENT_IP_PROTO"`, and `"CLIENT_IP_PORT_PROTO"`.                             | No       |         |
| `timeout_sec`         | optional(number)            | The amount of time (in seconds) that the load balancer will wait for a backend to respond before failing the request.                                                        | No       |         |
| `log_config`          | object(...)                 | Configuration for logging.  See "Log Configuration Object" below for details.                                                                                                | Yes      |         |
| `groups`              | list(object(...))            | A list of backend instance groups or network endpoint groups.  See "Group Object" below for details.                                                                      | Yes      |         |

#### Log Configuration Object:

| Attribute     | Type     | Description                                                                                                                                     | Required | Default |
|---------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `enable`      | optional(bool) | Determines if logging is enabled for the backend service.       | No       | |
| `sample_rate` | optional(number) | The sample rate of traffic for which logging is enabled. The value applies only when logging is enabled (enable = true).       | No       |         |

#### Group Object:

| Attribute                     | Type                        | Description                                                                                                                                                                            | Required | Default |
|-------------------------------|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `group`                       | string                      | The self-link of the instance group or network endpoint group that will serve as the backend. Must be a valid instance group or NEG. Example: `"https://www.googleapis.com/compute/v1/projects/my-project-123/zones/us-central1-a/instanceGroups/my-instance-group"`. | Yes      |         |
| `balancing_mode`              | optional(string)            | The balancing mode used when sending traffic to the backend. Valid values depend on the `backend_type`:  `"UTILIZATION"`, `"CONNECTION"`, and `"RATE"` when the backend is an instance group. Only `"CONNECTION"` available when the backend is a network endpoint group.                                         | No       |         |
| `capacity_scaler`             | optional(number)            | A multiplier applied to the group's maximum connections, maximum rate, or maximum utilization, depending on the `balancing_mode`.                                                     | No       |         |
| `description`         | optional(string)            | A text description of the Group. | No       |         |
| `max_connections`             | optional(number) | Maximum number of connections that a backend can handle. Required when `balancing_mode = "CONNECTION"` and group is instance group                                                                                  | No       |         |
| `max_connections_per_instance`   | optional(number)  | The maximum number of connections that an instance can handle, per instance for all of the instances in a group. Required when `balancing_mode = "CONNECTION"` and group is instance group.       | No       |         |
| `max_connections_per_endpoint`   | optional(number)            | The maximum number of connections that a endpoint can handle per endpoint. This is used only if the group is a NEG.                      | No       |         |
| `max_rate`          | optional(number)            | Used with balancing mode RATE, all backends MUST have a maxRate defined.   For more details, please check the documentation.                                                     | No       |         |
| `max_rate_per_instance` | optional(number)            | This is only used for Instance Groups, it specifies the maximum number of packets/s that every instance can handle.   For more details, please check the documentation.             | No    |       |
| `max_rate_per_endpoint` | optional(number)  | The maximum packets/s that a endpoint can handle. This is used only for NEGs, it specifies the maximum number of packets/s that every endpoint can handle.  For more details, please check the documentation.             | No      |        |
| `max_utilization`             | optional(number)            | Maximum backend utilization (0.0 to 1.0).  Required when `balancing_mode = "UTILIZATION"`.                                                                                                     | No       |         |

#### Health Check Configuration Object:

| Attribute             | Type                | Description                                                                                                                                                                                    | Required | Default |
|-----------------------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `check_interval_sec`  | optional(number)    | How often (in seconds) to send a health check.                                                                                                                                                | No       |         |
| `healthy_threshold`   | optional(number)    | The number of consecutive successful health checks required before considering an instance healthy.                                                                                           | No       |         |
| `timeout_sec`         | optional(number)    | How long (in seconds) to wait for a response from the instance.                                                                                                                              | No       |         |
| `unhealthy_threshold` | optional(number)    | The number of consecutive failed health checks required before considering an instance unhealthy.                                                                                             | No       |         |
| `tcp_health_check`    | object(...)         | Configuration for the TCP health check. See "TCP Health Check Configuration Object" below for details.                                                                                       | Yes      |         |

#### TCP Health Check Configuration Object:

| Attribute               | Type                | Description                                                                                                                            | Required | Default |
|-------------------------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `request`               | optional(string)    | The content to send in the health check request.                                                                                         | No       |         |
| `response`              | optional(string)    | Expected TCP response content.                                                                                                          | No       |         |
| `port`                  | optional(number)    | The port number to use for the health check.                                                                                             | No       |         |
| `port_name`             | optional(string)    | The port name to use for the health check.                                                                                             | No       |         |
| `port_specification`  | optional(string)    | Specifies how port is selected for health checking, can be one of USE_FIXED_PORT, USE_NAMED_PORT, USE_SERVING_PORT. For more details, please check the documentation | No     |          |
| `proxy_header`          | optional(string)    | The type of proxy header to send in the health check request.   Valid values: `NONE`, `DEFAULT`.                                        | No       |         |

Here the description on this module, https://github.com/terraform-google-modules/terraform-google-lb/tree/master/modules/regional_proxy_lb.
* Creates a regional External TCP Proxy Load Balancer
* Support instance group and network endpoint group (zonal and internet).
* Support for proxy header.
* Creates only the needed resources (no forwarding rule if no backends) and support a variable to avoid the LB creation.

**Note**
* For Proxy Only Subnet:
  * The network needs to have private service access enabled. See more details in the [module examples](https://github.com/terraform-google-modules/terraform-google-service-networking/tree/master/examples/private_service_access).
* TCP load balancing is a premium tier feature.
* It uses the new `compute.googleapis.com/global/networks/peeringRoutesConfig` feature that is enabled by default.

To deploy the following resources, you need to assign these roles to the service account. You can assign one single role that contains all the permissions such as:
* roles/compute.networkAdmin

If you want to create a custom role with the least privilege, it needs to contain the following permissions:
* compute.addresses.create
* compute.backendServices.create
* compute.firewalls.create
* compute.forwardingRules.create
* compute.globalAddresses.create
* compute.healthChecks.create
* compute.instanceGroups.create
* compute.networkEndpointGroups.create
* compute.networks.use
* compute.networks.useExternalIpAddresses
* compute.regionBackendServices.create
* compute.subnetworks.use
* compute.subnetworks.useExternalIpAddresses
* serviceusage.services.enable
* compute.regionNetworkEndpointGroups.create
