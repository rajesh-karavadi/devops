
resource "google_project_iam_custom_role" "cicd_run_deployer" {
  project     = var.project_id
  role_id     = "cicdRunDeployer"
  title       = "CI/CD Run Deployer"
  description = "Custom role for deploying to Cloud Run"
  permissions = var.role_permissions
}

resource "google_project_iam_member" "assign_cicdRunDeployer" {
  project = var.project_id
  role    = google_project_iam_custom_role.cicd_run_deployer.name
  member  = "serviceAccount:${var.cicd_sa_email}"
  depends_on = [google_project_iam_custom_role.cicd_run_deployer]
}
