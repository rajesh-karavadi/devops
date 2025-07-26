variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "GCP Region"
}

variable "service_name" {
  type        = string
  default     = "gcp-sentiment-api"
  description = "Cloud Run service name"
}

variable "image_name" {
  description = "Docker image name"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
}

variable "cicd_sa_email" {
  type        = string
  description = "CI/CD service account email (e.g. terraform-cicd@project.iam.gserviceaccount.com)"
}
