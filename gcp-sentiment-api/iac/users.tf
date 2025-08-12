resource "google_service_account" "terraform_cicd" {
  account_id   = var.cicd_sa_email
  display_name = "Terraform CI/CD Service Account"
}

resource "google_project_iam_member" "terraform_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.terraform_cicd.email}"
}