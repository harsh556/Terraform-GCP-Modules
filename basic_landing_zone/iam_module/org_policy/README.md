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
| [org](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/organization | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [org\_policies](variable.tf#L1) | Configuration for setting organization policies and custom constraints at the organization level. | <pre>map(object({<br/>    organization_id = string<br/>    custom_constraints = optional(map(object({<br/>      custom_constraints_resource_types = list(string)<br/>      custom_constraints_method_types   = list(string)<br/>      custom_constraints_condition      = string<br/>      custom_constraints_action_type    = string<br/>      custom_constraints_display_name   = string<br/>      custom_constraints_description    = string<br/>    })))<br/>    org_policy = map(object({<br/>      rules = list(object({<br/>        enforce = optional(bool)<br/>        allow = optional(object({<br/>          all    = optional(bool)<br/>          values = optional(list(string))<br/>        }))<br/>        deny = optional(object({<br/>          all    = optional(bool)<br/>          values = optional(list(string))<br/>        }))<br/>        condition = optional(object({<br/>          expression  = string<br/>          title       = optional(string)<br/>          description = optional(string)<br/>          location    = optional(string)<br/>        }))<br/>      }))<br/>    }))<br/>  }))</pre> | <pre>{<br/>  "org_policy_1": {<br/>    "custom_constraints": {},<br/>    "org_policy": {<br/>      "compute.restrictXpnProjectLienRemoval": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "compute.skipDefaultNetworkCreation": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "compute.vmExternalIpAccess": {<br/>        "rules": [<br/>          {<br/>            "allow": {<br/>              "all": false<br/>            }<br/>          }<br/>        ]<br/>      },<br/>      "gcp.resourceLocations": {<br/>        "rules": [<br/>          {<br/>            "allow": {<br/>              "values": [<br/>                "asia-south-1",<br/>                "africa-south1"<br/>              ]<br/>            }<br/>          }<br/>        ]<br/>      },<br/>      "iam.allowedPolicyMemberDomains": {<br/>        "rules": [<br/>          {<br/>            "allow": {<br/>              "values": [<br/>                "C0xxxxxxx",<br/>                "C0yyyyyyy"<br/>              ]<br/>            }<br/>          },<br/>          {<br/>            "allow": {<br/>              "all": false<br/>            }<br/>          }<br/>        ]<br/>      },<br/>      "iam.automaticIamGrantsForDefaultServiceAccounts": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "iam.disableServiceAccountKeyUpload": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          },<br/>          {<br/>            "condition": {<br/>              "description": "test condition",<br/>              "expression": "resource.matchTagId('tagKeys/1234', 'tagValues/1234')",<br/>              "location": "somewhere",<br/>              "title": "condition"<br/>            },<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "iam.restrictCrossProjectServiceAccountLienRemoval": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      },<br/>      "sql.restrictPublicIp": {<br/>        "rules": [<br/>          {<br/>            "enforce": false<br/>          }<br/>        ]<br/>      }<br/>    },<br/>    "organization_id": "organizations/1234"<br/>  }<br/>}</pre> | yes |


<a name="input_org_policies"></a>

### `org_policies` Details:

This input variable is a map where each key represents an identifier for a set of organization policies you want to define. The value associated with each key is an object that configures both organization policies and custom constraints for a specific organization.

#### Organization Policy Configuration Object:

| Attribute          | Type                                         | Description                                                                                                                                                                                    | Required | Default |
|--------------------|----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `organization_id`  | string                                       | The ID of the organization to apply the policies to (e.g., `"organizations/123456789"`).                                                                                                    | Yes      |         |
| `custom_constraints` | optional(map(Custom Constraint Object))     | A map defining custom constraints to be applied to the organization. The key of the map is the constraint name. If not specified, no custom constraints are created.                                                             | No       | `{}`      |
| `org_policy`       | map(Org Policy Object)                      | A map defining the organization policies to be applied. The key of the map is the policy name.   If not specified, the organization policies will not be altered                                                                                                     | No       | `{}`      |

#### Custom Constraint Object:

| Attribute                             | Type           | Description                                                                                                                                                 | Required | Default |
|---------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `custom_constraints_resource_types`   | list(string)   | A list of the resource types that the constraint applies to (e.g., `["container.googleapis.com/Cluster"]`).                                                       | Yes      |         |
| `custom_constraints_method_types`     | list(string)   | A list of the method types that the constraint applies to (e.g., `["google.container.v1.ClusterManager.CreateCluster"]`).                                                     | Yes      |         |
| `custom_constraints_condition`        | string         | The CEL expression that defines the constraint's logic.                                                                                                       | Yes      |         |
| `custom_constraints_action_type`      | string         | The action to take when the constraint is violated. Valid values are `"ALLOW"` or `"DENY"`.                                                                   | Yes      |         |
| `custom_constraints_display_name`     | string         | A user-friendly name for the constraint.                                                                                                                    | Yes      |         |
| `custom_constraints_description`      | string         | A detailed description of the constraint.                                                                                                                     | Yes      |         |

#### Org Policy Object:

| Attribute | Type   | Description | Required | Default |
| --------- | ------ | ----------- | -------- | ------- |
| `rules`   | list(Rule Object) | A list of rules that define the behavior of the organization policy. | Yes | |

#### Rule Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `enforce` | optional(bool) | If set to `true`, the policy is enforced. If set to `false`, the policy is not enforced.  Cannot be used with `allow` or `deny`. | No |  |
| `allow`   | optional(AllowDeny Object) | Allows specific values. Cannot be used with `enforce` or `deny`. | No |  |
| `deny`    | optional(AllowDeny Object) | Denies specific values. Cannot be used with `enforce` or `allow`. | No |  |
| `condition` | optional(Condition Object) | A condition that must be met for the rule to apply. | No |  |

#### AllowDeny Object:

| Attribute | Type | Description | Required | Default |
| --------- | ---- | ----------- | -------- | ------- |
| `all`   | optional(bool) | If set to `true`, all values are allowed/denied. Cannot be used with `values`. | No |  |
| `values` | optional(list(string)) | A list of values that are allowed/denied (e.g., `["projects/my-project"]`). Cannot be used with `all`. | No |  |

#### Condition Object:

| Attribute   | Type   | Description                                                                                                                                 | Required | Default |
|-------------|--------|---------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `expression`  | string | The CEL expression that defines the condition.                                                                                               | Yes      |         |
| `title`     | optional(string) | A title for the condition.                                                                                                                      | No       |         |
| `description` | optional(string) | A description of the condition.                                                                                                                   | No       |         |
| `location`  | optional(string) | The location where the condition is defined.                                                                                                       | No       |         |