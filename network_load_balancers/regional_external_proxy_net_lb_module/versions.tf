terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.21" # OR ">= 6.21, < 7.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.21" # OR ">= 6.21, < 7.0"
    }
  }
}