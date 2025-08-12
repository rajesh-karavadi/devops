

# 1️⃣ Workload Identity Pool
resource "google_iam_workload_identity_pool" "github_pool" {
  project       = var.project_id
  workload_identity_pool_id = "github-pool"
  display_name  = "GitHub Actions Pool"
  description   = "Trust for GitHub Actions OIDC"
}

# 2️⃣ Workload Identity Provider
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  project        = var.project_id
  workload_identity_pool_id = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-provider"
  display_name   = "GitHub OIDC Provider"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  attribute_mapping = {
    "google.subject"      = "assertion.sub == 'repo:organization/repository'"
    "attribute.repository" = "assertion.repository"
  }
}

# 3️⃣ Service Account for Terraform
resource "google_service_account" "terraform_sa" {
  project      = var.project_id
  account_id   = "terraform-cicd"
  display_name = "Terraform GitHub Actions"
}

# 4️⃣ Grant Minimal Roles (adjust as needed)
# resource "google_project_iam_member" "terraform_roles" {
#   for_each = toset([
#     "roles/storage.admin",       # Example: GCS for Terraform backend
#     "roles/compute.admin",       # Example: Compute
#     "roles/iam.serviceAccountUser" # Needed for impersonating other SAs
#   ])
#   project = var.project_id
#   role    = each.value
#   member  = "serviceAccount:${google_service_account.terraform_sa.email}"
# }

# 5️⃣ Allow GitHub to Impersonate this SA
resource "google_service_account_iam_member" "wif_binding" {
  service_account_id = google_service_account.terraform_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_pool.workload_identity_pool_id}/attribute.repository/${var.github_repo}"
}
