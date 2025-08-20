terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.27.0, < 7.0.0"
    }
  }
  required_version = ">= 1.0.0" # or your minimum terraform version
}