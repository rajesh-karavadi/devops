provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "java_docker_repo" {
  provider     = google
  location     = "us-east1"
  repository_id = "java-images"
  format       = "DOCKER"
  description  = "Docker repository for Java apps"
}

resource "google_cloud_run_service" "java_app" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image_uri

        ports {
          container_port = 8080
        }
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "public_access" {
  location    = google_cloud_run_service.java_app.location
  project     = var.project_id
  service     = google_cloud_run_service.java_app.name
  role        = "roles/run.invoker"
  member      = "allUsers"
}
