terraform {
  required_version = ">= 1.10.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.21.0, < 7.0.0" # tftest
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.21.0, < 7.0.0" # tftest
    }
  }
  provider_meta "google" {
    module_name = "google-pso-tool/cloud-foundation-fabric/modules/gke-cluster-standard:v38.0.0-tf"
  }
  provider_meta "google-beta" {
    module_name = "google-pso-tool/cloud-foundation-fabric/modules/gke-cluster-standard:v38.0.0-tf"
  }
}
