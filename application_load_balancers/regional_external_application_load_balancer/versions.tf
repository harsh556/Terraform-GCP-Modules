terraform {
  required_version = ">= 1.10.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.28.0, < 7.0.0" # tftest
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.28.0, < 7.0.0" # tftest
    }
  }
}