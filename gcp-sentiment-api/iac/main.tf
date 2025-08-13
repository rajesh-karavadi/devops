provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket  = "peerless-robot-426711-j3-tfstate" # create in GCS beforehand
    prefix  = "gcp-sentiment-api/state"
  }
}

resource "google_cloud_run_service" "sentiment_api" {
  name     = var.app_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }

  metadata {
    annotations = {
      "deployment-trigger" = var.image
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  timeouts {
    create = "15m"
    update = "5m"
    delete = "5m"
  }
}

resource "google_cloud_run_service_iam_member" "public_invoker" {
  service  = google_cloud_run_service.sentiment_api.name
  location = google_cloud_run_service.sentiment_api.location
  role     = "roles/run.invoker"
  member   = var.cloudrun_invoker
}


