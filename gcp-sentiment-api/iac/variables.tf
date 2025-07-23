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

variable "image" {
  type        = string
  description = "Docker image (from Docker Hub or Artifact Registry)"
}
