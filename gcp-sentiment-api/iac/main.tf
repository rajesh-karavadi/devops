provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "default" {
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

# resource "google_cloud_run_service_iam_member" "sainvoker" {
#   location = var.region
#   service  = google_cloud_run_service.default.name
#   role     = "roles/run.invoker"
#   member   = "serviceAccount:${var.cicd_sa_email}"
# }

# Only allow a specific Google account
resource "google_cloud_run_service_iam_member" "user_invoker" {
  service  = google_cloud_run_service.default.name
  location = var.region
  role     = "roles/run.invoker"
  member   = var.invoke_member
}
