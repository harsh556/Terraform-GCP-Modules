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
| [security\_policy](main.tf#L1) | GoogleCloudPlatform/cloud-armor/google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [armor\_config](variable.tf#L1) | Configuration for creating and managing Cloud Armor security policies. | <pre>map(object({<br/>    project_id  = string<br/>    name        = string<br/>    description = string<br/>    pre_configured_rules = optional(map(object({<br/>      action                  = string<br/>      priority                = number<br/>      description             = optional(string)<br/>      preview                 = optional(bool, false)<br/>      redirect_type           = optional(string, null)<br/>      redirect_target         = optional(string, null)<br/>      target_rule_set         = string<br/>      sensitivity_level       = optional(number, 4)<br/>      include_target_rule_ids = optional(list(string), [])<br/>      exclude_target_rule_ids = optional(list(string), [])<br/>      rate_limit_options = optional(object({<br/>        enforce_on_key      = optional(string)<br/>        enforce_on_key_name = optional(string)<br/>        enforce_on_key_configs = optional(list(object({<br/>          enforce_on_key_name = optional(string)<br/>          enforce_on_key_type = optional(string)<br/>        })))<br/>        exceed_action                        = optional(string)<br/>        rate_limit_http_request_count        = optional(number)<br/>        rate_limit_http_request_interval_sec = optional(number)<br/>        ban_duration_sec                     = optional(number)<br/>        ban_http_request_count               = optional(number)<br/>        ban_http_request_interval_sec        = optional(number)<br/>      }))<br/><br/>      header_action = optional(list(object({<br/>        header_name  = optional(string)<br/>        header_value = optional(string)<br/>      })))<br/><br/>      preconfigured_waf_config_exclusions = optional(map(object({<br/>        target_rule_set = string<br/>        target_rule_ids = optional(list(string), [])<br/>        request_header = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>        request_cookie = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>        request_uri = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>        request_query_param = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>      })))<br/>    })), {})<br/>    security_rules = optional(map(object({<br/>      action          = string<br/>      priority        = number<br/>      description     = optional(string)<br/>      preview         = optional(bool, false)<br/>      redirect_type   = optional(string, null)<br/>      redirect_target = optional(string, null)<br/>      src_ip_ranges   = list(string)<br/>      rate_limit_options = optional(object({<br/>        enforce_on_key      = optional(string)<br/>        enforce_on_key_name = optional(string)<br/>        enforce_on_key_configs = optional(list(object({<br/>          enforce_on_key_name = optional(string)<br/>          enforce_on_key_type = optional(string)<br/>        })))<br/>        exceed_action                        = optional(string)<br/>        rate_limit_http_request_count        = optional(number)<br/>        rate_limit_http_request_interval_sec = optional(number)<br/>        ban_duration_sec                     = optional(number)<br/>        ban_http_request_count               = optional(number)<br/>        ban_http_request_interval_sec        = optional(number)<br/>      }))<br/>      header_action = optional(list(object({<br/>        header_name  = optional(string)<br/>        header_value = optional(string)<br/>      })))<br/>    })), {})<br/>    custom_rules = optional(map(object({<br/>      action          = string<br/>      priority        = number<br/>      description     = optional(string)<br/>      preview         = optional(bool, false)<br/>      expression      = string<br/>      redirect_type   = optional(string, null)<br/>      redirect_target = optional(string, null)<br/>      rate_limit_options = optional(object({<br/>        enforce_on_key      = optional(string)<br/>        enforce_on_key_name = optional(string)<br/>        enforce_on_key_configs = optional(list(object({<br/>          enforce_on_key_name = optional(string)<br/>          enforce_on_key_type = optional(string)<br/>        })))<br/>        exceed_action                        = optional(string)<br/>        rate_limit_http_request_count        = optional(number)<br/>        rate_limit_http_request_interval_sec = optional(number)<br/>        ban_duration_sec                     = optional(number)<br/>        ban_http_request_count               = optional(number)<br/>        ban_http_request_interval_sec        = optional(number)<br/>      }))<br/>      header_action = optional(list(object({<br/>        header_name  = optional(string)<br/>        header_value = optional(string)<br/>      })))<br/><br/>      preconfigured_waf_config_exclusions = optional(map(object({<br/>        target_rule_set = string<br/>        target_rule_ids = optional(list(string), [])<br/>        request_header = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>        request_cookie = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>        request_uri = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>        request_query_param = optional(list(object({<br/>          operator = string<br/>          value    = optional(string)<br/>        })))<br/>      })))<br/>    })), {})<br/>    threat_intelligence_rules = optional(map(object({<br/>      action      = string<br/>      priority    = number<br/>      description = optional(string)<br/>      preview     = optional(bool, false)<br/>      feed        = string<br/>      exclude_ip  = optional(string)<br/>      rate_limit_options = optional(object({<br/>        enforce_on_key      = optional(string)<br/>        enforce_on_key_name = optional(string)<br/>        enforce_on_key_configs = optional(list(object({<br/>          enforce_on_key_name = optional(string)<br/>          enforce_on_key_type = optional(string)<br/>        })))<br/>        exceed_action                        = optional(string)<br/>        rate_limit_http_request_count        = optional(number)<br/>        rate_limit_http_request_interval_sec = optional(number)<br/>        ban_duration_sec                     = optional(number)<br/>        ban_http_request_count               = optional(number)<br/>        ban_http_request_interval_sec        = optional(number)<br/>      }))<br/>      header_action = optional(list(object({<br/>        header_name  = optional(string)<br/>        header_value = optional(string)<br/>      })))<br/>    })), {})<br/>    adaptive_protection_auto_deploy = optional(object({<br/>      enable                      = bool<br/>      priority                    = optional(number, null)<br/>      action                      = optional(string, null)<br/>      preview                     = optional(bool, false)<br/>      description                 = optional(string)<br/>      load_threshold              = optional(number)<br/>      confidence_threshold        = optional(number)<br/>      impacted_baseline_threshold = optional(number)<br/>      expiration_sec              = optional(number)<br/>      redirect_type               = optional(string)<br/>      redirect_target             = optional(string)<br/><br/>      rate_limit_options = optional(object({<br/>        enforce_on_key      = optional(string)<br/>        enforce_on_key_name = optional(string)<br/><br/>        enforce_on_key_configs = optional(list(object({<br/>          enforce_on_key_name = optional(string)<br/>          enforce_on_key_type = optional(string)<br/>        })))<br/><br/>        exceed_action                        = optional(string)<br/>        rate_limit_http_request_count        = optional(number)<br/>        rate_limit_http_request_interval_sec = optional(number)<br/>        ban_duration_sec                     = optional(number)<br/>        ban_http_request_count               = optional(number)<br/>        ban_http_request_interval_sec        = optional(number<br/>      }))<br/>    }))<br/>    }<br/>  ))</pre> | `n/a` | yes |

<a name="input_armor_config"></a>

### `armor_config` Details:

This input variable is a map where each key represents an identifier for a Cloud Armor security policy you want to create. The value associated with each key is an object defining the security policy's configuration and rules.

#### Security Policy Configuration Object:

| Attribute                       | Type                                                    | Description                                                                                                                                                              | Required | Default |
| ------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `project_id`                    | string                                                  | The ID of the Google Cloud project where the security policy will be created.                                                                                              | Yes      |         |
| `name`                          | string                                                  | The name of the security policy. Must be unique within the project.                                                                                                      | Yes      |         |
| `description`                   | string                                                  | A description of the security policy.                                                                                                                                  | Yes      |         |
| `pre_configured_rules`          | optional(map(Pre-Configured Rule Object))                | A map defining pre-configured Web Application Firewall (WAF) rules.  The key of the map is the name of the rule.   If not specified, no pre-configured rules are added.                                                                                                          | No       | `{}`      |
| `security_rules`                | optional(map(Security Rule Object))                      | A map defining security rules based on source IP ranges. The key of the map is the name of the rule. If not specified, no security rules are added.  | No       | `{}`      |
| `custom_rules`                  | optional(map(Custom Rule Object))                        | A map defining security rules based on custom expressions. The key of the map is the name of the rule. If not specified, no custom rules are added. | No       | `{}`      |
| `threat_intelligence_rules` | optional(map(Threat Intelligence Rule Object)) | A map defining security rules based on threat intelligence feeds.  The key of the map is the name of the rule.  If not specified, no threat intelligence rules are added. | No       | `{}`      |
| `adaptive_protection_auto_deploy` | optional(Adaptive Protection Auto Deploy Object)  | Configuration for Adaptive Protection auto-deployment of rules. If not specified, Adaptive Protection is not configured. | No       |         |

#### Pre-Configured Rule Object:

| Attribute                       | Type                                                    | Description                                                                                                                                                 | Required | Default |
| ------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `action`                          | string                                                  | The action to take when the rule matches. Valid values:  `allow`, `deny([statusCode])`, `redirect`.                                           | Yes      |         |
| `priority`                        | number                                                  | The priority of the rule. Lower values indicate higher priority. Must be between 0 and 2147483647, inclusive.                                                 | Yes      |         |
| `description`                   | optional(string)                                        | A description of the rule.                                                                                                                                | No       |         |
| `preview`                       | optional(bool)                                          | If set to `true`, the rule is evaluated but not enforced. Default: `false`.                                                                                | No       | `false`   |
| `redirect_type`                 | optional(string)                                        | The type of redirect to perform if the action is `redirect`.   Valid values: `EXTERNAL_302`, `GOOGLE_RECAPTCHA_502`, `INTERNAL_302`. | No       | `null`    |
| `redirect_target`               | optional(string)                                        | The target of the redirect if the action is `redirect`.  This can be a URL or other resource. | No       | `null`    |
| `target_rule_set`               | string                                                  | The target rule set for the pre-configured WAF rule.  Valid values: `OWASP_TOP_10`, `GOOGLE_DDoS`.                                                          | Yes      |         |
| `sensitivity_level`             | optional(number)                                        | The sensitivity level for the WAF rule.  Valid values: 0-4.  Higher values indicate greater sensitivity. Default: `4`.                                    | No       | `4`       |
| `include_target_rule_ids`       | optional(list(string))                                  | A list of specific rule IDs to include from the `target_rule_set`.  If empty, all rules from the set are included.                                             | No       | `[]`      |
| `exclude_target_rule_ids`       | optional(list(string))                                  | A list of specific rule IDs to exclude from the `target_rule_set`.                                                                                              | No       | `[]`      |
| `rate_limit_options`            | optional(Rate Limit Options Object)                       | Configuration for rate limiting.                                                                                                                              | No       |         |
| `header_action`   | optional(list(Header Action Object))      | The header actions that are performed if this route rule matches.   | No       |    |
| `preconfigured_waf_config_exclusions` | optional(map(Preconfigured WAF Config Exclusions Object)) |  Exclusions to apply to the preconfigured WAF configuration.   | No       |    |

#### Security Rule Object:

| Attribute         | Type                      | Description                                                                                                                                                  | Required | Default |
| ----------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `action`          | string                    | The action to take when the rule matches. Valid values: `allow`, `deny([statusCode])`, `redirect`.                                         | Yes      |         |
| `priority`        | number                    | The priority of the rule. Lower values indicate higher priority. Must be between 0 and 2147483647, inclusive.                                              | Yes      |         |
| `description`     | optional(string)          | A description of the rule.                                                                                                                               | No       |         |
| `preview`         | optional(bool)          | If set to `true`, the rule is evaluated but not enforced. Default: `false`.                                                                              | No       | `false`   |
| `redirect_type`   | optional(string)        | The type of redirect to perform if the action is `redirect`.  Valid values: `EXTERNAL_302`, `GOOGLE_RECAPTCHA_502`, `INTERNAL_302`. | No       | `null`    |
| `redirect_target` | optional(string)        | The target of the redirect if the action is `redirect`. This can be a URL or other resource.                                                                                               | No       | `null`    |
| `src_ip_ranges`   | list(string)            | A list of source IP address ranges (CIDR notation) to which the rule applies.                                                                            | Yes      |         |
| `rate_limit_options`            | optional(Rate Limit Options Object)                       | Configuration for rate limiting.                                                                                                                              | No       |         |
| `header_action`   | optional(list(Header Action Object))      | The header actions that are performed if this route rule matches. | No       |    |

#### Custom Rule Object:

| Attribute                       | Type                                                    | Description                                                                                                                               | Required | Default |
| ------------------------------- | ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `action`                          | string                                                  | The action to take when the rule matches. Valid values: `allow`, `deny([statusCode])`, `redirect`.              | Yes      |         |
| `priority`                        | number                                                  | The priority of the rule. Lower values indicate higher priority. Must be between 0 and 2147483647, inclusive.                        | Yes      |         |
| `description`                   | optional(string)                                        | A description of the rule.                                                                                                              | No       |         |
| `preview`                       | optional(bool)                                          | If set to `true`, the rule is evaluated but not enforced. Default: `false`.                                                              | No       | `false`   |
| `expression`                      | string                                                  | The Cloud Armor custom expression to evaluate.                                                                                             | Yes      |         |
| `redirect_type`                 | optional(string)                                        | The type of redirect to perform if the action is `redirect`.  Valid values: `EXTERNAL_302`, `GOOGLE_RECAPTCHA_502`, `INTERNAL_302`. | No       | `null`    |
| `redirect_target`               | optional(string)                                        | The target of the redirect if the action is `redirect`. This can be a URL or other resource.                                                                                             | No       | `null`    |
| `rate_limit_options`            | optional(Rate Limit Options Object)                       | Configuration for rate limiting.                                                                                                        | No       |         |
| `header_action`   | optional(list(Header Action Object))      | The header actions that are performed if this route rule matches. | No       |    |
| `preconfigured_waf_config_exclusions` | optional(map(Preconfigured WAF Config Exclusions Object)) |  Exclusions to apply to the preconfigured WAF configuration.   | No       |    |

#### Threat Intelligence Rule Object:

| Attribute        | Type     | Description | Required | Default |
|------------------|----------|-------------|----------|---------|
| `action`         | string   | The action to take when the rule matches. Valid values:  `allow`, `deny([statusCode])`, `redirect`. | Yes      |         |
| `priority`       | number   | The priority of the rule. Lower values indicate higher priority. Must be between 0 and 2147483647, inclusive. | Yes      |         |
| `description`    | optional(string) | A description of the rule.  | No       |         |
| `preview`        | optional(bool) | If set to `true`, the rule is evaluated but not enforced. Default: `false`. | No       | `false`   |
| `feed`  | string   |  The threat intelligence feed to use for the rule.  Valid values are documented in the Google Cloud Armor documentation. | Yes      |    |
| `exclude_ip` | optional(string) | An IP address or range to exclude from the threat intelligence feed. | No       |         |
| `rate_limit_options`            | optional(Rate Limit Options Object)                       | Configuration for rate limiting.                                                                                                        | No       |         |
| `header_action`   | optional(list(Header Action Object))      | The header actions that are performed if this route rule matches. | No       |    |

#### Adaptive Protection Auto Deploy Object:

| Attribute                     | Type              | Description                                                                                                                                                     | Required | Default |
| ----------------------------- | ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `enable`                      | bool              | Enable or Disable auto deploy of adaptive protection rules.                                                                                                        | Yes      |         |
| `priority`                    | optional(number)    | The priority of the auto deployed rule. Lower values indicate higher priority. If set to null, it is configured automatically.                                 | No       | `null`    |
| `action`                      | optional(string)    | The action to take when the rule matches. Valid values:  `allow`, `deny([statusCode])`, `redirect`. If set to null, it is configured automatically.          | No       | `null`    |
| `preview`                     | optional(bool)      | If set to `true`, the rule is evaluated but not enforced. Default: `false`.                                                                                     | No       | `false`   |
| `description`                 | optional(string)    | A description of the rule.                                                                                                                                  | No       |         |
| `load_threshold`              | optional(number)    | A threshold of the load to trigger auto deploy.                                                                                                                  | No       |         |
| `confidence_threshold`        | optional(number)    | A threshold of the confidence to trigger auto deploy.                                                                                                              | No       |         |
| `impacted_baseline_threshold` | optional(number)    | A threshold of the impacted baseline to trigger auto deploy.                                                                                                         | No       |         |
| `expiration_sec`              | optional(number)    | The number of seconds the rule will be active for.                                                                                                                 | No       |         |
| `redirect_type`               | optional(string)    | The type of redirect to perform if the action is `redirect`.   Valid values: `EXTERNAL_302`, `GOOGLE_RECAPTCHA_502`, `INTERNAL_302`. | No       |   |
| `redirect_target`             | optional(string)    | The target of the redirect if the action is `redirect`. This can be a URL or other resource.                                                                    | No       |         |
| `rate_limit_options`            | optional(Rate Limit Options Object)                       | Configuration for rate limiting.                                                                                                        | No       |         |

#### Rate Limit Options Object:

| Attribute                           | Type                                                    | Description                                                                                                                                        | Required | Default |
| ----------------------------------- | ------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `enforce_on_key`                    | optional(string)                                        | The key to enforce rate limiting on. Valid values: `"ALL_IPS"`, `"HTTP_HEADER"`, `"GEO"`, `"HTTP_COOKIE"`.                                            | No       |         |
| `enforce_on_key_name`               | optional(string)                                        | The name of the header or cookie to enforce rate limiting on if `enforce_on_key` is set to `"HTTP_HEADER"` or `"HTTP_COOKIE"`.                      | No       |         |
| `enforce_on_key_configs`          | optional(list(Enforce On Key Configs Object))        | Configuration for rate limiting on a specific key configuration.                                                                                    | No       |         |
| `exceed_action`                     | optional(string)                                        | The action to take when the rate limit is exceeded. Valid values: `"throttle"`, `"ban"`, `"redirect"`.                                            | No       |         |
| `rate_limit_http_request_count`     | optional(number)                                        | The number of HTTP requests allowed during the interval specified by `rate_limit_http_request_interval_sec`.                                        | No       |         |
| `rate_limit_http_request_interval_sec`| optional(number)                                        | The interval (in seconds) during which `rate_limit_http_request_count` requests are allowed.                                                          | No       |         |
| `ban_duration_sec`                  | optional(number)                                        | The duration (in seconds) to ban an IP address that exceeds the rate limit. Only applicable if `exceed_action` is set to `"ban"`.                       | No       |         |
| `ban_http_request_count`            | optional(number)                                        | The number of HTTP requests that must be received from an IP address during the interval specified by `ban_http_request_interval_sec` to trigger a ban. | No       |         |
| `ban_http_request_interval_sec`     | optional(number)                                        | The interval (in seconds) during which `ban_http_request_count` requests must be received from an IP address to trigger a ban.                     | No       |         |

#### Enforce On Key Configs Object:

| Attribute             | Type     | Description                                                                         | Required | Default |
| --------------------- | -------- | ----------------------------------------------------------------------------------- | -------- | ------- |
| `enforce_on_key_name` | optional(string) | The name for enforce key. | No      |  |
| `enforce_on_key_type` | optional(string) | The type for enforce key. Can be `"CLIENT_IP"`, `"HTTP_HEADER"`, `"HTTP_COOKIE"` | No      |  |

#### Header Action Object:

| Attribute         | Type       | Description                                                                                                          | Required | Default |
|-----------------|------------|------------------------------------------------------------------------------------------------------|----------|---------|
| `header_name` | string   | The name of the HTTP header to insert.  | Yes      |   |
| `header_value`  | string | The value of the HTTP header to insert.  | Yes      |    |

#### Preconfigured WAF Config Exclusions Object:

| Attribute            | Type       | Description                                                                          | Required | Default |
|----------------------|------------|--------------------------------------------------------------------------------------|----------|---------|
| `target_rule_set`     | string   |  The target rule set to apply the exclusion to. It can be `"OWASP_TOP_10"` or `"GOOGLE_DDoS"`. | Yes      |   |
| `target_rule_ids`   | optional(list(string)) |  A list of target rule IDs to exclude from the `target_rule_set`. | No | `[]`    |
| `request_header`      | optional(list(Request Header Object)) |  A list of request header to match on. | No       |   |
| `request_cookie`      | optional(list(Request Cookie Object)) |  A list of request cookie to match on.  | No       |    |
| `request_uri`        | optional(list(Request Uri Object))    |  A list of request URI to match on.   | No      |   |
| `request_query_param` | optional(list(Request Query Param Object))|  A list of query parameters to match on.  | No      |   |

#### Request Header Object:

| Attribute   | Type      | Description                                                              | Required | Default |
|-------------|-----------|--------------------------------------------------------------------------|----------|---------|
| `operator` | string  |  The operator to use for matching the header.  Valid values: `"EQUALS"`, `"STARTS_WITH"`, `"ENDS_WITH"`, `"CONTAINS"`, `"EQUALS_IGNORE_CASE"`, `"STARTS_WITH_IGNORE_CASE"`, `"ENDS_WITH_IGNORE_CASE"`, `"CONTAINS_IGNORE_CASE"`. | Yes      |    |
| `value`  | string | The value to match in the header.  | Yes       |   |

#### Request Cookie Object:

| Attribute   | Type      | Description                                                              | Required | Default |
|-------------|-----------|--------------------------------------------------------------------------|----------|---------|
| `operator` | string  | The operator to use for matching the cookie. Valid values: `"EQUALS"`, `"STARTS_WITH"`, `"ENDS_WITH"`, `"CONTAINS"`, `"EQUALS_IGNORE_CASE"`, `"STARTS_WITH_IGNORE_CASE"`, `"ENDS_WITH_IGNORE_CASE"`, `"CONTAINS_IGNORE_CASE"`.  | Yes      |    |
| `value`  | string | The value to match in the cookie.  | Yes       |   |

#### Request Uri Object:

| Attribute   | Type      | Description                                                              | Required | Default |
|-------------|-----------|--------------------------------------------------------------------------|----------|---------|
| `operator` | string  | The operator to use for matching the URI. Valid values: `"EQUALS"`, `"STARTS_WITH"`, `"ENDS_WITH"`, `"CONTAINS"`, `"EQUALS_IGNORE_CASE"`, `"STARTS_WITH_IGNORE_CASE"`, `"ENDS_WITH_IGNORE_CASE"`, `"CONTAINS_IGNORE_CASE"`.  | Yes      |    |
| `value`  | string | The value to match in the URI. | Yes       |   |

#### Request Query Param Object:

| Attribute   | Type      | Description                                                              | Required | Default |
|-------------|-----------|--------------------------------------------------------------------------|----------|---------|
| `operator` | string  | The operator to use for matching the query parameter. Valid values: `"EQUALS"`, `"STARTS_WITH"`, `"ENDS_WITH"`, `"CONTAINS"`, `"EQUALS_IGNORE_CASE"`, `"STARTS_WITH_IGNORE_CASE"`, `"ENDS_WITH_IGNORE_CASE"`, `"CONTAINS_IGNORE_CASE"`.  | Yes      |    |
| `value`  | string | The value to match in the query parameter. | Yes       |   |

