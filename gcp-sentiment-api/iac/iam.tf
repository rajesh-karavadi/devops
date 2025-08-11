
resource "google_project_iam_custom_role" "cicd_run_deployer" {
  project     = var.project_id
  role_id     = "cicdRunDeployer"
  title       = "CI/CD Run Deployer"
  description = "Custom role for deploying to Cloud Run"
  permissions = var.deployer_permissions
}

# Give the SA permissions to read/write Terraform state
resource "google_storage_bucket_iam_member" "cicd_sa_object_admin" {
  bucket = var.bucket_name
  role   = var.sa_roles
  member = "serviceAccount:${var.cicd_sa_email}"
}

resource "google_project_iam_member" "assign_cicdRunDeployer" {
  project = var.project_id
  role    = google_project_iam_custom_role.cicd_run_deployer.name
  member  = "serviceAccount:${var.cicd_sa_email}"
  depends_on = [google_project_iam_custom_role.cicd_run_deployer]
}

# Only allow a specific Google account
resource "google_cloud_run_service_iam_member" "user_invoker" {
  service  = google_cloud_run_service.default.name
  location = var.region
  role     = var.invoker_role
  member   = var.invoker
}
