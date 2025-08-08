# resource "google_project_iam_custom_role" "cicd_run_deployer" {
#   role_id     = "cicdRunDeployer"
#   title       = "CI/CD Cloud Run Deployer"
#   description = "Least-privilege role for CI/CD to deploy to Cloud Run"
#   project     = var.project_id
#
#   permissions = [
#     "run.services.get",
#     "run.services.update",
#     "iam.serviceAccounts.actAs",
#   ]
# }
#
# resource "google_project_iam_member" "cicd_run_deployer_binding" {
#   project = var.project_id
#   role    = google_project_iam_custom_role.cicd_run_deployer.name
#   member  = "serviceAccount:${var.cicd_sa_email}"
# }

# resource "google_project_iam_member" "run_admin" {
#   project = var.project_id
#   role    = "roles/run.admin"
#   member  = "serviceAccount:${var.cicd_sa_email}"
# }

# resource "google_project_iam_member" "sa_user" {
#   project = var.project_id
#   role    = "roles/iam.serviceAccountUser"
#   member  = "serviceAccount:${var.cicd_sa_email}"
# }

# resource "google_service_account_iam_member" "limited_sa_user" {
#   service_account_id = "projects/${var.project_id}/serviceAccounts/${var.cicd_sa_email}"
#   role               = "roles/iam.serviceAccountUser"
#   member             = "serviceAccount:${var.cicd_sa_email}"
# }

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
