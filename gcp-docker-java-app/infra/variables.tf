variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-east1"
}

variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
}

variable "image_uri" {
  description = "Docker image URI from Artifact Registry"
  type        = string
}
