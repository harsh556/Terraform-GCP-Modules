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
| [gar](main.tf#L1) | github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/artifact-registry | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [gar\_config](variable.tf#l1) | Configuration for creating Artifact Registry repositories. | <pre>map(object({<br/>    project_id     = string<br/>    name           = string<br/>    location       = string<br/>    labels         = optional(map(string))<br/>    description    = optional(string)<br/>    encryption_key = optional(string)<br/>    format = object({<br/>      apt = optional(object({<br/>        remote = optional(object({<br/>          public_repository           = string<br/>          disable_upstream_validation = optional(bool)<br/>          upstream_credentials = optional(object({<br/>            username                = string<br/>            password_secret_version = string<br/>          }))<br/>        }))<br/>        standard = optional(bool)<br/>      }))<br/>      docker = optional(object({<br/>        remote = optional(object({<br/>          public_repository           = optional(string)<br/>          custom_repository           = optional(string)<br/>          disable_upstream_validation = optional(bool)<br/>          upstream_credentials = optional(object({<br/>            username                = string<br/>            password_secret_version = string<br/>          }))<br/>        }))<br/>        standard = optional(object({<br/>          immutable_tags = optional(bool)<br/>        }))<br/>        virtual = optional(map(object({<br/>          repository = string<br/>          priority   = number<br/>        })))<br/>      }))<br/>      kfp = optional(object({<br/>        standard = optional(bool)<br/>      }))<br/>      generic = optional(object({<br/>        standard = optional(bool)<br/>      }))<br/>      go = optional(object({<br/>        standard = optional(bool)<br/>      }))<br/>      googet = optional(object({<br/>        standard = optional(bool)<br/>      }))<br/>      maven = optional(object({<br/>        remote = optional(object({<br/>          public_repository = optional(string)<br/>          custom_repository = optional(string)<br/><br/>          disable_upstream_validation = optional(bool)<br/>          upstream_credentials = optional(object({<br/>            username                = string<br/>            password_secret_version = string<br/>          }))<br/>        }))<br/>        standard = optional(object({<br/>          allow_snapshot_overwrites = optional(bool)<br/>          version_policy            = optional(string)<br/>        }))<br/>        virtual = optional(map(object({<br/>          repository = string<br/>          priority   = number<br/>        })))<br/>      }))<br/>      npm = optional(object({<br/>        remote = optional(object({<br/>          public_repository = optional(string)<br/>          custom_repository = optional(string)<br/><br/>          disable_upstream_validation = optional(bool)<br/>          upstream_credentials = optional(object({<br/>            username                = string<br/>            password_secret_version = string<br/>          }))<br/>        }))<br/>        standard = optional(bool)<br/>        virtual = optional(map(object({<br/>          repository = string<br/>          priority   = number<br/>        })))<br/>      }))<br/>      python = optional(object({<br/>        remote = optional(object({<br/>          public_repository = optional(string)<br/>          custom_repository = optional(string)<br/><br/>          disable_upstream_validation = optional(bool)<br/>          upstream_credentials = optional(object({<br/>            username                = string<br/>            password_secret_version = string<br/>          }))<br/>        }))<br/>        standard = optional(bool)<br/>        virtual = optional(map(object({<br/>          repository = string<br/>          priority   = number<br/>        })))<br/>      }))<br/>      yum = optional(object({<br/>        remote = optional(object({<br/>          public_repository = string <br/><br/>          disable_upstream_validation = optional(bool)<br/>          upstream_credentials = optional(object({<br/>            username                = string<br/>            password_secret_version = string<br/>          }))<br/>        }))<br/>        standard = optional(bool)<br/>      }))<br/>    })<br/>    cleanup_policy_dry_run = optional(bool)<br/>    cleanup_policies = optional(map(object({<br/>      action = string<br/>      condition = optional(object({<br/>        tag_state             = optional(string)<br/>        tag_prefixes          = optional(list(string))<br/>        older_than            = optional(string)<br/>        newer_than            = optional(string)<br/>        package_name_prefixes = optional(list(string))<br/>        version_name_prefixes = optional(list(string))<br/>      }))<br/>      most_recent_versions = optional(object({<br/>        package_name_prefixes = optional(list(string))<br/>        keep_count            = optional(number)<br/>      }))<br/>    })))<br/>  }))</pre> | n/a | yes |

## Outputs

No outputs.

<a name="input_gar_config"></a>

### `gar_config` Details:

This input variable is a map where each key represents an identifier for an Artifact Registry repository you want to create. The value associated with each key is an object defining the repository's configuration.

#### Artifact Registry Repository Configuration Object:

| Attribute            | Type        | Description                                                                                                                                                                                            | Required | Default |
| -------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `project_id`         | string      | The ID of the Google Cloud project where the repository will be created.                                                                                                                               | Yes      |         |
| `name`               | string      | The name of the repository. Must be unique within the location.                                                                                                                                        | Yes      |         |
| `location`           | string      | The location where the repository will be created (e.g., `"us-central1"`).                                                                                                                              | Yes      |         |
| `labels`             | optional(map(string)) | A map of labels to apply to the repository.                                                                                                                                                   | No       |         |
| `description`        | optional(string) | A description of the repository.                                                                                                                                                                   | No       |         |
| `encryption_key`     | optional(string) | The KMS key name to use for encrypting the repository.                                                                                                                                             | No       |         |
| `format`             | Format Object | Configuration for the repository format (e.g., `"apt"`, `"docker"`, `"maven"`).  Only *one* format should be defined.                                                                               | Yes      |         |
| `cleanup_policy_dry_run` | optional(bool) | If set to true, the cleanup policies is performed as a dry run to validate it, set to true, after successful test, set to false to make it active  | No      |         |
| `cleanup_policies` | optional(map(Cleanup Policy Object))  | configuration for the artifact cleanup policies. The key of the map is the name of the cleanup policy | No    |        |

#### Format Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `apt` | optional(APT Object) | Configuration for an APT repository. Cannot be used with any other format. | No | |
| `docker` | optional(Docker Object) | Configuration for a Docker repository. Cannot be used with any other format. | No | |
| `kfp` | optional(KFP Object) | Configuration for a KFP repository. Cannot be used with any other format. | No | |
| `generic` | optional(Generic Object) | Configuration for a Generic repository. Cannot be used with any other format. | No | |
| `go` | optional(Go Object) | Configuration for a Go repository. Cannot be used with any other format. | No | |
| `googet` | optional(Googet Object) | Configuration for a Googet repository. Cannot be used with any other format. | No | |
| `maven` | optional(Maven Object) | Configuration for a Maven repository. Cannot be used with any other format. | No | |
| `npm` | optional(NPM Object) | Configuration for an NPM repository. Cannot be used with any other format. | No | |
| `python` | optional(Python Object) | Configuration for a Python repository. Cannot be used with any other format. | No | |
| `yum` | optional(YUM Object) | Configuration for a YUM repository. Cannot be used with any other format. | No | |

#### APT Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `remote` | optional(APT Remote Object) | Configuration for a remote APT repository. | No | |
| `standard` | optional(bool) | If set to `true`, create a standard APT repository.  | No | |

#### Docker Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `remote` | optional(Docker Remote Object) | Configuration for a remote Docker repository. | No | |
| `standard` | optional(Docker Standard Object) | Configuration for a standard Docker repository. | No | |
| `virtual`| optional(map(Docker Virtual Object)) | Configuration for a Virtual repository.  | No | |

#### KFP Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `standard` | optional(bool) | If set to `true`, create a standard KFP repository. | No | |

#### Generic Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `standard` | optional(bool) | If set to `true`, create a standard Generic repository. | No | |

#### Go Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `standard` | optional(bool) | If set to `true`, create a standard Go repository. | No | |

#### Googet Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `standard` | optional(bool) | If set to `true`, create a standard Googet repository. | No | |

#### Maven Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `remote` | optional(Maven Remote Object) | Configuration for a remote Maven repository. | No | |
| `standard` | optional(Maven Standard Object) | Configuration for a standard Maven repository. | No | |
| `virtual`| optional(map(Maven Virtual Object)) | Configuration for a Virtual repository.  | No | |

#### NPM Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `remote` | optional(NPM Remote Object) | Configuration for a remote NPM repository. | No | |
| `standard` | optional(bool) | If set to `true`, create a standard NPM repository. | No | |
| `virtual`| optional(map(NPM Virtual Object)) | Configuration for a Virtual repository.  | No | |

#### Python Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `remote` | optional(Python Remote Object) | Configuration for a remote Python repository. | No | |
| `standard` | optional(bool) | If set to `true`, create a standard Python repository. | No | |
| `virtual`| optional(map(Python Virtual Object)) | Configuration for a Virtual repository.  | No | |

#### YUM Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `remote` | optional(YUM Remote Object) | Configuration for a remote YUM repository. | No | |
| `standard` | optional(bool) | If set to `true`, create a standard YUM repository. | No | |

#### APT Remote Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `public_repository` | string | The name of the public repository to mirror (e.g., `"debian-bullseye"`). | Yes | |
| `disable_upstream_validation` | optional(bool) |  Whether to disable upstream validation  | No |  |
| `upstream_credentials` | optional(Upstream Credentials Object) |  Authentication configuration for accessing the upstream repository.  | No | |

#### Docker Remote Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `public_repository` | optional(string) | The name of the public repository to mirror (e.g., `"docker-hub"`). Only one type of source may exist. | No | |
| `custom_repository` | optional(string) | URL for custom artifact repository. Only one type of source may exist. | No | |
| `disable_upstream_validation` | optional(bool) |  Whether to disable upstream validation  | No |  |
| `upstream_credentials` | optional(Upstream Credentials Object) |  Authentication configuration for accessing the upstream repository.  | No | |

#### Maven Remote Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `public_repository` | optional(string) | The name of the public repository to mirror (e.g., `"central"`). Only one type of source may exist. | No | |
| `custom_repository` | optional(string) | URL for custom artifact repository. Only one type of source may exist. | No | |
| `disable_upstream_validation` | optional(bool) |  Whether to disable upstream validation  | No |  |
| `upstream_credentials` | optional(Upstream Credentials Object) |  Authentication configuration for accessing the upstream repository.  | No | |

#### NPM Remote Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `public_repository` | optional(string) | The name of the public repository to mirror (e.g., `"npmjs"`). Only one type of source may exist. | No | |
| `custom_repository` | optional(string) | URL for custom artifact repository. Only one type of source may exist. | No | |
| `disable_upstream_validation` | optional(bool) |  Whether to disable upstream validation  | No |  |
| `upstream_credentials` | optional(Upstream Credentials Object) |  Authentication configuration for accessing the upstream repository.  | No | |

#### Python Remote Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `public_repository` | optional(string) | The name of the public repository to mirror (e.g., `"pypi"`). Only one type of source may exist. | No | |
| `custom_repository` | optional(string) | URL for custom artifact repository. Only one type of source may exist. | No | |
| `disable_upstream_validation` | optional(bool) |  Whether to disable upstream validation  | No |  |
| `upstream_credentials` | optional(Upstream Credentials Object) |  Authentication configuration for accessing the upstream repository.  | No | |

#### YUM Remote Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `public_repository` | string | The name of the public repository to mirror (e.g., `"centos-8"`).  | Yes | |
| `disable_upstream_validation` | optional(bool) |  Whether to disable upstream validation  | No |  |
| `upstream_credentials` | optional(Upstream Credentials Object) |  Authentication configuration for accessing the upstream repository.  | No | |

#### Upstream Credentials Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `username` | string | Username used to access the repository. | Yes | |
| `password_secret_version` | string | The secret version of the password.  This should be in the format `"projects/<project>/secrets/<secret>/versions/<version>"`. | Yes | |

#### Docker Standard Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `immutable_tags` | optional(bool) | If set to `true`, only allow immutable tags in the repository. | No | |

#### Maven Standard Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `allow_snapshot_overwrites` | optional(bool) | If set to `true`, allow snapshot versions to be overwritten in the repository. | No | |
| `version_policy` | optional(string) | The version policy for the repository. Valid values are `"RELEASE"`, `"SNAPSHOT"`, and `"MIXED"`. | No | |

#### Docker Virtual Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `repository` | string | The repository to include in the virtual repository. | Yes | |
| `priority` | number | The priority of the repository. Lower values indicate higher priority. | Yes | |

#### Maven Virtual Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `repository` | string | The repository to include in the virtual repository. | Yes | |
| `priority` | number | The priority of the repository. Lower values indicate higher priority. | Yes | |

#### NPM Virtual Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `repository` | string | The repository to include in the virtual repository. | Yes | |
| `priority` | number | The priority of the repository. Lower values indicate higher priority. | Yes | |

#### Python Virtual Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `repository` | string | The repository to include in the virtual repository. | Yes | |
| `priority` | number | The priority of the repository. Lower values indicate higher priority. | Yes | |

#### Cleanup Policy Object:

| Attribute | Type   | Description                                                                            | Required | Default |
| --------- | ------ | -------------------------------------------------------------------------------------- | -------- | ------- |
| `action`   | string |  action used to clean up the version  `"DELETE"`: Deletes the artifact.  `"KEEP"`: Retains the artifact | Yes |   |
| `condition` | optional(Condition Object) | Configuration for version name, tag and date conditions. | No | |
| `most_recent_versions` | optional(Most Recent Versions Object) | Configuration to retains the most recent versios  | No | |

#### Condition Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `tag_state`  | optional(string) |  Artifacts with any specified tag will be deleted, valid arguments `ANY`, `TAGGED`, `UNTAGGED`  | No |  |
| `tag_prefixes`| optional(list(string)) |  Only artifacts with tags matching specified prefixes will be deleted. | No |  |
| `older_than`| optional(string) |  Artifacts created before the specified duration will be deleted  | No |   |
| `newer_than`   | optional(string) |  Artifacts created after the specified duration will be deleted   | No | |
| `package_name_prefixes`| optional(list(string)) |  Only artifacts with package names matching specified prefixes will be deleted. | No |   |
| `version_name_prefixes`  | optional(list(string)) | Only artifacts with versions matching specified prefixes will be deleted.   | No |    |

#### Most Recent Versions Object:

| Attribute | Type | Description | Required | Default |
|---|---|---|---|---|
| `package_name_prefixes`| optional(list(string)) |  Only artifacts with package names matching specified prefixes will be retained | No |   |
| `keep_count`   | optional(number) |  Minimum number of versions to keep  | No |    |

