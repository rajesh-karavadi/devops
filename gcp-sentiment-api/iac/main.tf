# provider "google" {
#   project = var.project_id
#   region  = var.region
# }
#
# terraform {
#   backend "gcs" {
#     bucket  = "my-terraform-state-bucket"  # create in GCS beforehand
#     prefix  = "gcp-sentiment-api/state"
#   }
# }
#
# resource "google_cloud_run_service" "default" {
#   name     = var.app_name
#   location = var.region
#
#   template {
#     spec {
#       containers {
#         image = var.image
#       }
#     }
#   }
#
#   metadata {
#     annotations = {
#       "deployment-trigger" = var.image
#     }
#   }
#
#   traffic {
#     percent         = 100
#     latest_revision = true
#   }
#
#   timeouts {
#     create = "15m"
#     update = "5m"
#     delete = "5m"
#   }
# }
