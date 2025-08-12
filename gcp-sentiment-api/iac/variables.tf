# variable "region" {}
# variable "app_name" {}
# variable "image" {}
# variable "bucket_name" {}
# variable "bucket_location" {}
# variable "cicd_user" {}
#
# variable "cicd_sa_email" {}
# variable "deployer_permissions" {}
# variable "invoker_role" {}
#
# variable "invoker" {}
# variable "deployer_role" {}

variable "project_id" {
  description = "Your GCP Project ID"
  type        = string
}

variable "service_account_id" {
  default     = "terraform-cicd"
  description = "Service account ID (short name)"
}

variable "service_account_display_name" {
  default     = "Terraform CI/CD Service Account"
}

variable "sa_roles" {
  description = "Roles for the service account"
  type        = list(string)
  default = [
    "roles/storage.admin",         # For GCS state file access
    "roles/iam.serviceAccountUser" # To manage resources as SA
  ]
}