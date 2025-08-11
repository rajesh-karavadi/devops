variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}
variable "bucket_name" {
  description = "GCS bucket for Terraform state"
  type        = string
}

variable "bucket_location" {
  description = "Location for the Terraform state bucket"
  type        = string
  default     = "US"
}

variable "cicd_sa_email" {
  description = "CI/CD Service Account email"
  type        = string
}

variable "deployer_permissions" {
  description = "Permissions for custom Cloud Run deployer role"
  type        = list(string)
}

variable "invoker_role" {
  description = "Role to allow Cloud Run invocation"
  type        = string
  default     = "roles/run.invoker"
}

variable "invoker" {
  description = "Member allowed to invoke Cloud Run (e.g., user:email@example.com)"
  type        = string
}