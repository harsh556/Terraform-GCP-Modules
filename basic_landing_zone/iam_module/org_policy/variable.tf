variable "org_policies" {
  type = map(object({
    organization_id = string
    custom_constraints = optional(map(object({
      custom_constraints_resource_types = list(string)
      custom_constraints_method_types   = list(string)
      custom_constraints_condition      = string
      custom_constraints_action_type    = string
      custom_constraints_display_name   = string
      custom_constraints_description    = string
    })))
    org_policy = map(object({
      rules = list(object({
        enforce = optional(bool)
        allow = optional(object({
          all    = optional(bool)
          values = optional(list(string))
        }))
        deny = optional(object({
          all    = optional(bool)
          values = optional(list(string))
        }))
        condition = optional(object({
          expression  = string
          title       = optional(string)
          description = optional(string)
          location    = optional(string)
        }))
      }))
    }))
  }))

  default = {
    org_policy_1 = {
      organization_id = "organizations/1234"
      custom_constraints = {
      }
      org_policy = {
        "iam.disableServiceAccountKeyUpload" : { # Policy Constraint 1
          rules = [
            {
              enforce = false
            },
            {
              condition = {
                expression  = "resource.matchTagId('tagKeys/1234', 'tagValues/1234')"
                title       = "condition"
                description = "test condition"
                location    = "somewhere"
              },
              enforce = false
            },
          ]
        },
        "sql.restrictPublicIp" : { # Policy Constraint 2
          rules = [
            {
              enforce = false
            },
          ]
        },
        "compute.vmExternalIpAccess" : { # Policy Constraint 3
          rules = [
            {
              allow = {
                all = false
              }
            },
          ]
        },
        "compute.restrictXpnProjectLienRemoval" : { # Policy Constraint 4
          rules = [
            {
              enforce = false
            },
          ]
        },
        "compute.skipDefaultNetworkCreation" : { # Policy Constraint 5
          rules = [
            {
              enforce = false
            },
          ]
        },
        "iam.automaticIamGrantsForDefaultServiceAccounts" : { # Policy Constraint 6
          rules = [
            {
              enforce = false
            },
          ]
        },
        "iam.restrictCrossProjectServiceAccountLienRemoval" : { # Policy Constraint 7
          rules = [
            {
              enforce = false
            },
          ]
        },
        "gcp.resourceLocations" : { # Policy Constraint 8
          rules = [
            {
              allow = {
                values = [
                  "asia-south-1",
                  "africa-south1"
                ]
              }
            },
          ]
        },
        "iam.allowedPolicyMemberDomains" : { # Policy Constraint 9
          rules = [
            {
              allow = {
                values = [
                  "C0xxxxxxx",
                  "C0yyyyyyy"
                ]
              }
            },
            {
              allow = {
                all = false
              }
            },
          ]
        },
      }
    }
  }
}
