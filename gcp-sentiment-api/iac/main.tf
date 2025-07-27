provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("key.json")
}

resource "google_cloud_run_service" "sentiment_api" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image_name

        ports {
          container_port = 8080
        }
        resources {
          limits = {
            memory = "512Mi"
            cpu    = "1"
          }
        }
      }
    }

    metadata {
      annotations = {
        "run.googleapis.com/execution-environment" = "gen2"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
}

resource "google_cloud_run_service_iam_member" "public_access" {
  location        = var.region
  project         = var.project_id
  service         = google_cloud_run_service.sentiment_api.name
  role            = "roles/run.invoker"
  member          = "allUsers"
}

