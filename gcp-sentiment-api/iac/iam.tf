resource "google_project_iam_custom_role" "cicdRunDeployer" {
  role_id     = "cicdRunDeployer"
  title       = "CICD Run Deployer"
  description = "Deploys Cloud Run services"
  permissions = [
    "run.services.create",
    "run.services.update",
    # add all required permissions
  ]
  project = var.project_id
}

resource "google_project_iam_member" "assign_cicdRunDeployer" {
  project = var.project_id
  role    = google_project_iam_custom_role.cicdRunDeployer.name
  member  = "serviceAccount:${var.cicd_sa_email}"
  depends_on = [google_project_iam_custom_role.cicdRunDeployer]
}
