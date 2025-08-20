terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.21.0, < 7.0.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.21.0, < 7.0.0"
    }
  }
}