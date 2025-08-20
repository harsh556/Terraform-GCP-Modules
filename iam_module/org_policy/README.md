## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.7.4 |
| [google](#requirement_google) | >= 6.1.0, < 7.0.0 |
| [google-beta](#requirement\_google-beta) | >= 6.1.0, < 7.0.0 |

## Providers

Google

## Modules

| Name | Source | Version |
|------|--------|---------|
| [org](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/organization | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [org\_policies](#input_org_policies) | A map defining organization policy configurations. This input enables the configuration of multiple organization policies and custom constraints at the organization level.  Organization policies enforce constraints on resources within the organization, helping to maintain security, compliance, and control. | <pre>map(object({<br/>    organization_id = string<br/>    custom_constraints = optional(map(object({<br/>      custom_constraints_resource_types = list(string)<br/>      custom_constraints_method_types   = list(string)<br/>      custom_constraints_condition      = string<br/>      custom_constraints_action_type    = string<br/>      custom_constraints_display_name   = string<br/>      custom_constraints_description    = string<br/>    })))<br/>    org_policy = map(object({<br/>      rules = list(object({<br/>        enforce = optional(bool)<br/>        allow = optional(object({<br/>          all    = optional(bool)<br/>          values = optional(list(string))<br/>        }))<br/>        deny = optional(object({<br/>          all    = optional(bool)<br/>          values = optional(list(string))<br/>        }))<br/>        condition = optional(object({<br/>          expression  = string<br/>          title       = optional(string)<br/>          description = optional(string)<br/>          location    = optional(string)<br/>        }))<br/>      }))<br/>    }))<br/>  }))</pre> | <pre>{<br/>  "org_policy_1": {<br/>    "custom_constraints": {},<br/>    "org_policy": {<br/>      "compute.restrictXpnProjectLienRemoval": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "compute.skipDefaultNetworkCreation": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "compute.vmExternalIpAccess": {<br/>        "rules": [<br/>          {<br/>            "allow": {<br/>              "all": false<br/>            }<br/>          }<br/>        ]<br/>      },<br/>      "gcp.resourceLocations": {<br/>        "rules": [<br/>          {<br/>            "allow": {<br/>              "values": [<br/>                "asia-south-1",<br/>                "africa-south1"<br/>              ]<br/>            }<br/>          }<br/>        ]<br/>      },<br/>      "iam.allowedPolicyMemberDomains": {<br/>        "rules": [<br/>          {<br/>            "allow": {<br/>              "values": [<br/>                "C0xxxxxxx",<br/>                "C0yyyyyyy"<br/>              ]<br/>            }<br/>          },<br/>          {<br/>            "allow": {<br/>              "all": false<br/>            }<br/>          }<br/>        ]<br/>      },<br/>      "iam.automaticIamGrantsForDefaultServiceAccounts": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "iam.disableServiceAccountKeyUpload": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          },<br/>          {<br/>            "condition": {<br/>              "description": "test condition",<br/>              "expression": "resource.matchTagId('tagKeys/1234', 'tagValues/1234')",<br/>              "location": "somewhere",<br/>              "title": "condition"<br/>            },<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "iam.restrictCrossProjectServiceAccountLienRemoval": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "sql.restrictPublicIp": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      }<br/>    },<br/>    "organization_id": "organizations/1234"<br/>  }<br/>}</pre> | yes |

<a name="input_org_policies"></a>

### `org_policies` Details:

This input variable is a map where each key represents a unique identifier for a set of organization policies. The value associated with each key is an object defining the organization ID, custom constraints, and organization policies.

#### Organization Policies Configuration Object:

| Attribute                     | Type                        | Description                                                                                                                                                           | Required | Default        |
|-------------------------------|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|----------------|
| `organization_id`             | string                      | The ID of the organization where the policies will be applied. Must be a valid Google Cloud organization ID. Example: `"organizations/1234567890"`.              | Yes      |                |
| `custom_constraints`          | optional(map(object(...)))   | A map defining custom organization policy constraints. See "Custom Constraints Object" below for details. If `null`, no custom constraints are created.        | No       | `{}`             |
| `org_policy`                | map(object(...))            | A map defining organization policies. The keys are the policy names, and the values are policy configuration objects. See "Organization Policy Object" below for details.  | Yes      |                |

#### Custom Constraints Object:

| Attribute                               | Type           | Description                                                                                                                                                                      | Required | Default |
|-----------------------------------------|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `custom_constraints_resource_types`   | list(string)    | List of Google Cloud resource types the constraint applies to.  Example: `["cloudresourcemanager.googleapis.com/Project"]`.                                                      | Yes      |         |
| `custom_constraints_method_types`     | list(string)    | List of methods the constraint applies to.  Valid values are `"CREATE"`, `"UPDATE"`.                                                                                          | Yes      |         |
| `custom_constraints_condition`        | string         | The CEL (Common Expression Language) expression that defines the constraint's condition.                                                                                      | Yes      |         |
| `custom_constraints_action_type`      | string         | The action to take when the constraint is violated.  Valid values are `"ALLOW"` and `"DENY"`.                                                                                | Yes      |         |
| `custom_constraints_display_name`     | string         | A display name for the custom constraint.                                                                                                                                      | Yes      |         |
| `custom_constraints_description`      | string         | A description for the custom constraint.                                                                                                                                       | Yes      |         |

#### Organization Policy Object:

| Attribute   | Type   | Description | Required | Default |
|---|---|---|---|---|
| `rules` | list(object(...)) | A list of rules that define the behavior of the organization policy. See "Rule Object" below for details. | Yes | |

#### Rule Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `enforce` | optional(bool) | If set to `true`, the policy is enforced. This is a simple on/off setting. | No | |
| `allow` | optional(object(...)) |  Configuration to allow specific values.  Cannot be used with `deny`. See "Allow/Deny Values Object" below. | No | |
| `deny` | optional(object(...)) | Configuration to deny specific values. Cannot be used with `allow`.  See "Allow/Deny Values Object" below. | No | |
| `condition` | optional(object(...)) | A condition that must be met for the rule to apply.  See "Condition Object" below for details. | No | |

#### Allow/Deny Values Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `all` | optional(bool) | If set to `true`, all values are allowed/denied. | No | |
| `values` | optional(list(string)) | A list of values to allow/deny. | No | |

#### Condition Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `expression` | string | The CEL (Common Expression Language) expression that defines the condition. | Yes | |
| `title` | optional(string) | A title for the condition. | No | |
| `description` | optional(string) | A description for the condition. | No | |
| `location` | optional(string) | The location where the condition is applicable. | No | |
