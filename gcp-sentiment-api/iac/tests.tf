# Define the Google Cloud provider
provider "google" {
  project = var.project_id # Replace with your GCP project ID
  region  = "us-central1"
}

# Create a Google Cloud service account
resource "google_service_account" "my_service_account" {
  account_id   = "my-terraform-sa"
  display_name = "Service Account for Terraform Management"
  description  = "This service account is used by Terraform to manage resources."
}

# Grant an IAM role to the service account
resource "google_project_iam_member" "service_account_role" {
  project = var.project_id # Replace with your GCP project ID
  role    = "roles/storage.admin" # Example role: Storage Admin
  member  = "serviceAccount:${google_service_account.my_service_account.email}"
}

# Output the service account email
output "service_account_email" {
  value = google_service_account.my_service_account.email
}