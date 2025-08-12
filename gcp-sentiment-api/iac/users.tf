# 1. Create the service account
resource "google_service_account" "terraform_cicd" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  project      = var.project_id
}

# 2. Assign roles to the service account
# Bind IAM role to allow this SA to be used (narrow scope)
resource "google_service_account_iam_member" "sa_user_binding" {
  service_account_id = google_service_account.terraform_cicd.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.terraform_cicd.email}"
}

# 3. Create and download a key (for GitHub Actions)
resource "google_service_account_key" "terraform_cicd_key" {
  service_account_id = google_service_account.terraform_cicd.name
}
