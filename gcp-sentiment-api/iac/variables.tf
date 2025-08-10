variable "project_id" {}
variable "region" {}
variable "app_name" {}
variable "image" {}
variable "cicd_sa_email" {
  type = string
  default = "terraform-cicd@peerless-robot-426711-j3.iam.gserviceaccount.com"
}
variable "invoke_member" {
  type = string
  default = "allUsers"
}

variable "environment" {
  type    = string
  default = "dev"
}
