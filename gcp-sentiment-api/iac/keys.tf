resource "google_service_account_key" "terraform_cicd_key" {
  service_account_id = google_service_account.terraform_cicd.name
}

