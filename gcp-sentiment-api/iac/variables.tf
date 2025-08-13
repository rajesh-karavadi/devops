variable "project_id" {}

variable "storage_role" {
  default = "objectAdmin"
}
variable "location" {
  default = "us-central1"
}

variable "bucket_name" {
  default = "tf-state-dev"
}

variable "sa_name" {
  default = "terraform-cicd-dev"
}

variable "region" {}
variable "app_name" {}
variable "image" {}
variable "cloudrun_invoker" {}

# variable "bucket_name" {}
# variable "bucket_location" {}
# variable "cicd_user" {}
#
# variable "cicd_sa_email" {}
# variable "deployer_permissions" {}
# variable "invoker_role" {}
#

# variable "deployer_role" {}

