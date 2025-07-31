resource "google_project_iam_custom_role" "cicd_run_deployer" {
  role_id     = "cicdRunDeployer"
  title       = "CI/CD Cloud Run Deployer"
  description = "Least-privilege role for CI/CD to deploy to Cloud Run"
  project     = var.project_id

  permissions = [
    "run.services.get",
    "run.services.update",
    "iam.serviceAccounts.actAs",
  ]
}

resource "google_project_iam_member" "cicd_run_deployer_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.cicd_run_deployer.name
  member  = "serviceAccount:${var.cicd_sa_email}"
}

# resource "google_project_iam_member" "run_admin" {
#   project = var.project_id
#   role    = "roles/run.admin"
#   member  = "serviceAccount:${var.cicd_sa_email}"
# }

resource "google_project_iam_member" "sa_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${var.cicd_sa_email}"
}
