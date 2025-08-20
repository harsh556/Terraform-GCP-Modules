terraform {
  backend "gcs" {
    bucket = var.backend_bucket_name   # replace this with the bucket name you want to store your remote state
    prefix = var.backend_bucket_prefix # replace this with the state file prefix inside the bucket
  }
}
