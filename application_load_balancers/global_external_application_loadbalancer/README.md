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
| [glb-0](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-lb-app-ext | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [global\_lb](variables.tf#L1) | Configuration for creating Global HTTP(S) Load Balancers. | <pre>map(object({<br/>    name       = string<br/>    project_id = string<br/>    region     = string<br/>    bucket = optional(string)<br/>    backends = list(object({<br/>      type = string<br/>      name = string<br/>      zone       = string<br/>    }))<br/>    cert_name    = list(string)<br/>    network      = string<br/>    sub_network  = string<br/>    protocol     = string<br/>    backend_type = optional(string)<br/>    urlmap_config = object({<br/>      default_service = optional(string)<br/>      default_url_redirect = optional(object({<br/>        host          = optional(string)<br/>        https         = optional(bool)<br/>        path          = optional(string)<br/>        prefix        = optional(string)<br/>        response_code = optional(string)<br/>        strip_query   = optional(bool)<br/>      }))<br/>      host_rules = optional(list(object({<br/>        hosts        = list(string)<br/>        path_matcher = string<br/>        description  = optional(string)<br/>      })))<br/>      path_matchers = optional(map(object({<br/>        description     = optional(string)<br/>        default_service = optional(string)<br/>        default_url_redirect = optional(object({<br/>          host          = optional(string)<br/>          https         = optional(bool)<br/>          path          = optional(string)<br/>          prefix        = optional(string)<br/>          response_code = optional(string)<br/>          strip_query   = optional(bool)<br/>        }))<br/>        path_rules = optional(list(object({<br/>          paths   = list(string)<br/>          service = optional(string)<br/>          route_action = optional(object({<br/>            request_mirror_backend = optional(string)<br/>            fault_injection_policy = optional(object({<br/>              abort = optional(object({<br/>                percentage = number<br/>                status     = number<br/>              }))<br/>              delay = optional(object({<br/>                fixed = object({<br/>                  seconds = number<br/>                  nanos   = number<br/>                })<br/>                percentage = number<br/>              }))<br/>            }))<br/>            retry_policy = optional(object({<br/>              num_retries      = number<br/>              retry_conditions = optional(list(string))<br/>              per_try_timeout = optional(object({<br/>                seconds = number<br/>                nanos   = optional(number)<br/>              }))<br/>            }))<br/>            timeout = optional(object({<br/>              seconds = number<br/>              nanos   = optional(number)<br/>            }))<br/>            url_rewrite = optional(object({<br/>              host        = optional(string)<br/>              path_prefix = optional(string)<br/>            }))<br/>            weighted_backend_services = optional(map(object({<br/>              weight = number<br/>              header_action = optional(object({<br/>                request_add = optional(map(object({<br/>                  value   = string<br/>                  replace = optional(bool, true)<br/>                })))<br/>                request_remove = optional(list(string))<br/>                response_add = optional(map(object({<br/>                  value   = string<br/>                  replace = optional(bool, true)<br/>                })))<br/>                response_remove = optional(list(string))<br/>              }))<br/>            })))<br/>          }))<br/>          url_redirect = optional(object({<br/>            host          = optional(string)<br/>            https         = optional(bool)<br/>            path          = optional(string)<br/>            prefix        = optional(string)<br/>            response_code = optional(string)<br/>            strip_query   = optional(bool)<br/>          }))<br/>        })))<br/>        route_rules = optional(list(object({<br/>          priority = number<br/>          service  = optional(string)<br/>          header_action = optional(object({<br/>            request_add = optional(map(object({<br/>              value   = string<br/>              replace = optional(bool, true)<br/>            })))<br/>            request_remove = optional(list(string))<br/>            response_add = optional(map(object({<br/>              value   = string<br/>              replace = optional(bool, true)<br/>            })))<br/>            response_remove = optional(list(string))<br/>          }))<br/>          match_rules = optional(list(object({<br/>            ignore_case = optional(bool, false)<br/>            headers = optional(list(object({<br/>              name         = string<br/>              invert_match = optional(bool, false)<br/>              type         = optional(string, "present") # exact, prefix, suffix, regex, present, range, template<br/>              value        = optional(string)<br/>              range_value = optional(object({<br/>                end   = string<br/>                start = string<br/>              }))<br/>            })))<br/>            metadata_filters = optional(list(object({<br/>              labels    = map(string)<br/>              match_all = bool # MATCH_ANY, MATCH_ALL<br/>            })))<br/>            path = optional(object({<br/>              value = string<br/>              type  = optional(string, "prefix") # full, prefix, regex<br/>            }))<br/>            query_params = optional(list(object({<br/>              name  = string<br/>              value = string<br/>              type  = optional(string, "present") # exact, present, regex<br/>            })))<br/>          })))<br/>          route_action = optional(object({<br/>            request_mirror_backend = optional(string)<br/>            fault_injection_policy = optional(object({<br/>              abort = optional(object({<br/>                percentage = number<br/>                status     = number<br/>              }))<br/>              delay = optional(object({<br/>                fixed = object({<br/>                  seconds = number<br/>                  nanos   = number<br/>                })<br/>                percentage = number<br/>              }))<br/>            }))<br/>            retry_policy = optional(object({<br/>              num_retries      = number<br/>              retry_conditions = optional(list(string))<br/>              per_try_timeout = optional(object({<br/>                seconds = number<br/>                nanos   = optional(number)<br/>              }))<br/>            }))<br/>            timeout = optional(object({<br/>              seconds = number<br/>              nanos   = optional(number)<br/>            }))<br/>            url_rewrite = optional(object({<br/>              host          = optional(string)<br/>              path_prefix   = optional(string)<br/>              path_template = optional(string)<br/>            }))<br/>            weighted_backend_services = optional(map(object({<br/>              weight = number<br/>              header_action = optional(object({<br/>                request_add = optional(map(object({<br/>                  value   = string<br/>                  replace = optional(bool, true)<br/>                })))<br/>                request_remove = optional(list(string))<br/>                response_add = optional(map(object({<br/>                  value   = string<br/>                  replace = optional(bool, true)<br/>                })))<br/>                response_remove = optional(list(string))<br/>              }))<br/>            })))<br/>          }))<br/>          url_redirect = optional(object({<br/>            host          = optional(string)<br/>            https         = optional(bool)<br/>            path          = optional(string)<br/>            prefix        = optional(string)<br/>            response_code = optional(string)<br/>            strip_query   = optional(bool)<br/>          }))<br/>        })))<br/>      })))<br/>      test = optional(list(object({<br/>        host        = string<br/>        path        = string<br/>        service     = string<br/>        description = optional(string)<br/>      })))<br/>    })<br/>  }))</pre> | `n/a` | yes |

<a name="input_global_lb"></a>

### `global_lb` Details:

This input variable is a map where each key represents an identifier for a Global HTTP(S) Load Balancer. The value associated with each key is an object defining the load balancer's configuration.

#### Global Load Balancer Configuration Object:

| Attribute      | Type        | Description                                                                          | Required | Default |
|----------------|-------------|--------------------------------------------------------------------------------------|----------|---------|
| `name`         | string      | The name of the load balancer. Must be unique within the project.                    | Yes      |         |
| `project_id`   | string      | The ID of the Google Cloud project where the load balancer will be created.        | Yes      |         |
| `region`       | string      | The region where the backend services reside (e.g., `"us-central1"`).  This affects the health check probes.          | Yes      |         |
| `bucket`   | optional(string)      | The bucket name to use for Cloud CDN.        | No      |         |
| `backends`     | list(Backend Object) | A list of backend services to which the load balancer will forward traffic. | Yes      |         |
| `cert_name`    | list(string) | A list of names of SSL certificates to use for HTTPS load balancing.             | Yes      |         |
| `network`      | string | The name of the VPC network to use for the load balancer.       | Yes      |         |
| `sub_network`      | string | The name of the sub network to use for the load balancer.       | Yes      |         |
| `protocol`     | string      | The protocol to use for the load balancer. Valid values are `"HTTP"` or `"HTTPS"`.  | Yes      |         |
| `backend_type` | optional(string) | Specifies whether the backends are instance groups or network endpoint groups.  Defaults to `GCE_VM_IP_PORT`. | No       |         |
| `urlmap_config`| optional(URL Map Object) | Configuration for the URL map, which defines how traffic is routed based on the incoming request's host and path. | No       |         |

#### Backend Object:

| Attribute | Type   | Description                                                                                                                                          | Required | Default |
|-----------|--------|------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `type`    | string | The type of backend.  Valid values depend on backend_type.                                                                       | Yes      |         |
| `name`    | string | The name of the backend service.                                                                                                                     | Yes      |         |
| `zone`    | string | The zone where the backend service is located.                                                                                                     | Yes      |         |

#### URL Map Object:

| Attribute        | Type                  | Description                                                                                                                                                         | Required | Default |
|------------------|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `default_service`| optional(string)      | The default backend service to use if no other rules match.                                                                                                     | No       |         |
| `default_url_redirect` | optional(URL Redirect Object) | The default URL redirect action to take if no other rules match.                                                                                                  | No       |         |
| `host_rules`     | optional(list(Host Rule Object)) | A list of host rules that map hostnames to path matchers.                                                                                                | No       |         |
| `path_matchers`  | optional(map(Path Matcher Object)) | A map of path matchers, where each key is a unique name for the path matcher.  Path matchers define how traffic is routed based on the request path. | No       |         |
| `test` | optional(list(Test Object)) | A list of tests to perform on the URL map. | No |         |

#### URL Redirect Object:

| Attribute     | Type     | Description                                                                             | Required | Default |
|---------------|----------|-----------------------------------------------------------------------------------------|----------|---------|
| `host`        | optional(string)   | The host to redirect to.                                                             | No       |         |
| `https`       | optional(bool)     | Whether to redirect to HTTPS.                                                         | No       |         |
| `path`        | optional(string)   | The path to redirect to.                                                             | No       |         |
| `prefix`      | optional(string)   | The prefix to redirect to.                                                           | No       |         |
| `response_code` | optional(string)   | The HTTP response code to use for the redirect.                                       | No       |         |
| `strip_query` | optional(bool)     | Whether to strip the query string from the redirect URL.                                | No       |         |

#### Host Rule Object:

| Attribute      | Type          | Description                                                                                                                                 | Required | Default |
|----------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `hosts`        | list(string)  | A list of hostnames to match (e.g., `["example.com", "*.example.com"]`).                                                                 | Yes      |         |
| `path_matcher` | string        | The name of the path matcher to use for this host.                                                                                           | Yes      |         |
| `description`  | optional(string)  | A description for the host rule.                                                                                                                          | No      |         |

#### Path Matcher Object:

| Attribute        | Type                        | Description                                                                                                                                            | Required | Default |
|------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `description`    | optional(string)            | A description for the path matcher.                                                                                                                      | No       |         |
| `default_service`| optional(string)            | The default backend service to use if no path rule matches.                                                                                             | No       |         |
| `default_url_redirect` | optional(URL Redirect Object) | The default URL redirect action to take if no other path rule matches.                                                                                                    | No       |         |
| `path_rules`     | optional(list(Path Rule Object))  | A list of path rules that map request paths to backend services or URL redirects.                                                                    | No       |         |
| `route_rules`| optional(list(Route Rule Object))    | A list of route rules that define how traffic is routed based on headers, metadata filters, paths, and query parameters.  | No       |         |

#### Path Rule Object:

| Attribute   | Type          | Description                                                                                                                                      | Required | Default |
|-------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `paths`     | list(string)  | A list of paths to match (e.g., `["/images", "/images/*"]`).                                                                                    | Yes      |         |
| `service`   | optional(string)  | The backend service to use if this path rule matches. Cannot be used with `url_redirect`.                                                                   | No       |         |
| `route_action` | optional(Route Action Object)   |  Used for advanced traffic management features like traffic mirroring, fault injection, retry policy, timeouts, and URL rewrites.                                                                                                         | No       |         |
| `url_redirect`| optional(URL Redirect Object) | The URL redirect action to take if this path rule matches. Cannot be used with `service`.  | No       |         |

#### Route Rule Object:

| Attribute        | Type        | Description                                                                  | Required | Default |
| ---------------- | ----------- | ------------------------------------------------------------ | -------- | ------- |
| `priority`         | number  | The priority of this route rule. Lower value == higher priority, default = 0.             | Yes     |         |
| `service`          | optional(string) | The backend service to use if this route rule matches.                  | No   |    |
| `header_action`    | optional(Header Action Object)   | The header actions that are performed if this route rule matches.   | No       |    |
| `match_rules`   | optional(list(Match Rule Object))      |  The list of match rules that define the conditions that must be met for this route rule to apply. |No  |    |
| `route_action` | optional(Route Action Object)     | Used for advanced traffic management features like traffic mirroring, fault injection, retry policy, timeouts, and URL rewrites. | No       |         |
| `url_redirect`| optional(URL Redirect Object) | The URL redirect action to take if this route rule matches. | No       |         |

#### Match Rule Object:

| Attribute        | Type                                      | Description                                                                                           | Required | Default          |
| ---------------- | ----------------------------------------- | ----------------------------------------------------------------------------------------------------- | -------- | ---------------- |
| `ignore_case`    | optional(bool)                              | If true, the header match is case-insensitive. Default: `false`.                                    | No       | `false`          |
| `headers`        | optional(list(Header Match Object))           | The list of header matches that define the conditions that must be met for the route to match the request. | No       |                    |
| `metadata_filters` | optional(list(Metadata Filter Object))      | The list of metadata filter that define the conditions that must be met for the route to match the request. | No       |                    |
| `path`           | optional(Path Match Object)               | The path match object that define the conditions that must be met for the route to match the request.   | No       |                    |
| `query_params`   | optional(list(Query Parameter Match Object)) | The list of query parameters that define the conditions that must be met for the route to match the request.   | No       |                    |

#### Header Match Object:

| Attribute      | Type                                        | Description                                                                                             | Required | Default   |
| ---------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------- | -------- | --------- |
| `name`         | string                                        | The name of the header to match.                                                                       | Yes      |           |
| `invert_match` | optional(bool)                              | If true, the match is inverted. Default: `false`.                                                       | No       | `false`   |
| `type`         | optional(string)                              | The type of header match. Valid values: `exact`, `prefix`, `suffix`, `regex`, `present`, `range`, `template`. Default: `present`. | No       | `"present"` |
| `value`        | optional(string)                              | The value to match if type is `exact`, `prefix`, `suffix`, `regex`, or `template`.                       | No       |           |
| `range_value` | optional(object({ end = string, start = string })) | The range to match if type is `range`.                                                                | No       |           |

#### Metadata Filter Object:

| Attribute      | Type                                        | Description                                                                                             | Required | Default   |
| ---------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------- | -------- | --------- |
| `labels`         | map(string) | A map of labels to match.       | Yes     |           |
| `match_all` | bool | Specifies how they should be matched -  `MATCH_ANY`, `MATCH_ALL`.                                                                             | Yes     |           |

#### Path Match Object:

| Attribute      | Type                                        | Description                                                                                             | Required | Default   |
| ---------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------- | -------- | --------- |
| `value`         | string                                        | The value of the path to match.                                                                     | Yes      |           |
| `type` | optional(string)                              | The type of path match. Valid values: `full`, `prefix`, `regex`. Default: `prefix`. | No       | `"prefix"` |

#### Query Parameter Match Object:

| Attribute      | Type                                        | Description                                                                                             | Required | Default   |
| ---------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------- | -------- | --------- |
| `name`         | string                                        | The name of the query parameter to match.                                                                      | Yes      |           |
| `value` | string | The value of the query parameter to match.        | Yes    |           |
| `type`         | optional(string)                              | The type of query parameter match. Valid values: `exact`, `present`, `regex`. Default: `present`. | No       | `"present"` |

#### Route Action Object:

| Attribute                  | Type                        | Description                                                                                                                                                                      | Required | Default |
| -------------------------- | ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `request_mirror_backend`   | optional(string)            | The backend service to mirror traffic to.                                                                                                                                        | No       |         |
| `fault_injection_policy`   | optional(Fault Injection Policy Object) | Configuration for fault injection (e.g., abort or delay requests).                                                                                                           | No       |         |
| `retry_policy`             | optional(Retry Policy Object) | Configuration for retry policy (e.g., number of retries, retry conditions, per-try timeout).                                                                                      | No       |         |
| `timeout`                  | optional(Timeout Object)      | Configuration for request timeout.                                                                                                                                               | No       |         |
| `url_rewrite`              | optional(URL Rewrite Object)  | Configuration for URL rewriting (e.g., host or path prefix).                                                                                                                     | No       |         |
| `weighted_backend_services`| optional(map(Weighted Backend Service Object)) |  A map of backend services and their weights, used for traffic splitting.                                                                                                               | No       |         |

#### Header Action Object:

| Attribute         | Type                               | Description                                                                                                                                | Required | Default    |
| ----------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ---------- |
| `request_add`     | optional(map(Header Value Object)) | A map of headers to add to the request. The key is the header name. | No       |       |
| `request_remove`  | optional(list(string))   | A list of header names to remove from the request.                       | No       |      |
| `response_add`    | optional(map(Header Value Object))  | A map of headers to add to the response. The key is the header name.   | No       |  |
| `response_remove` | optional(list(string)) | A list of header names to remove from the response.          | No       |      |

#### Header Value Object:

| Attribute | Type    | Description                                  | Required | Default          |
| --------- | ------- | -------------------------------------------- | -------- | ---------------- |
| `value`   | string  | The value of the header.                     | Yes      |                    |
| `replace` | optional(bool) | If true, replaces any existing header with the same name. Default: `true`. | No       | `true`           |

#### Fault Injection Policy Object:

| Attribute | Type  | Description | Required | Default |
| --------- | ----- | ----------- | -------- | ------- |
| `abort`   | optional(Abort Object)  | Configuration for aborting requests.                                                                                             | No       |         |
| `delay`   | optional(Delay Object)   | Configuration for delaying requests.                                                                                              | No       |         |

#### Abort Object:

| Attribute  | Type   | Description                                                              | Required | Default |
| ---------- | ------ | ------------------------------------------------------------------------ | -------- | ------- |
| `percentage` | number | The percentage of requests to abort.                                     | Yes      |         |
| `status`   | number | The HTTP status code to return when aborting requests.                     | Yes      |         |

#### Delay Object:

| Attribute | Type   | Description                                                               | Required | Default |
| ---------- | ------ | ------------------------------------------------------------------------- | -------- | ------- |
| `fixed`    | Fixed Delay Object  | Configuration for a fixed delay.                                                            | Yes      |         |
| `percentage` | number | The percentage of requests to delay.                                      | Yes      |         |

#### Fixed Delay Object:

| Attribute | Type   | Description                                                               | Required | Default |
| --------- | ------ | ------------------------------------------------------------------------- | -------- | ------- |
| `seconds` | number | The number of seconds to delay requests.                                   | Yes      |         |
| `nanos`   | number | The number of nanoseconds to delay requests.                                 | Yes      |         |

#### Retry Policy Object:

| Attribute       | Type               | Description                                                                                                                          | Required | Default |
| --------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `num_retries`      | number  | The maximum number of retries allowed.                                                                                                          | Yes      |         |
| `retry_conditions` | optional(list(string)) | A list of conditions under which a retry should be attempted.                                                               | No       |         |
| `per_try_timeout`  | optional(Timeout Object)      | Configuration for the timeout per retry attempt.                                                                                                           | No       |         |

#### Timeout Object:

| Attribute | Type   | Description                                                               | Required | Default |
| --------- | ------ | ------------------------------------------------------------------------- | -------- | ------- |
| `seconds` | number | The number of seconds for the timeout.                                     | Yes      |         |
| `nanos`   | optional(number) | The number of nanoseconds for the timeout.                                   | No      |         |

#### URL Rewrite Object:

| Attribute     | Type     | Description                                                                                                  | Required | Default |
|---------------|----------|--------------------------------------------------------------------------------------------------------------|----------|---------|
| `host`        | optional(string) | The host to rewrite to.                                                                                            | No       |         |
| `path_prefix` | optional(string) | The path prefix to rewrite to.                                                                                         | No       |         |
| `path_template` | optional(string) | The path template to rewrite to.                                                                                         | No       |         |

#### Weighted Backend Service Object:

| Attribute     | Type   | Description                                                                                                       | Required | Default |
|---------------|--------|-------------------------------------------------------------------------------------------------------------------|----------|---------|
| `weight`      | number | The weight to assign to this backend service.                                                                     | Yes      |         |
|  `header_action`    | optional(Header Action Object)   | The header actions that are performed if this route rule matches.   | No       |    |

#### Test Object:

| Attribute   | Type   | Description                                                 | Required | Default |
|-------------|--------|-------------------------------------------------------------|----------|---------|
| `host`      | string | The host to send the test request to.                       | Yes      |         |
| `path`      | string | The path to send the test request to.                       | Yes      |         |
| `service`   | string | The backend service that should be used for the test.     | Yes      |         |
| `description` | optional(string) | A description of the test.        | No      |         |