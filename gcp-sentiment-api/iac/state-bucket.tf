variable "location" {
  default = "us-central1"
}

variable "bucket_name" {
  default = "terraform-state-dev-bucket"
}

variable "sa_name" {
  default = "terraform-cicd-dev"
}

# Create GCS bucket for remote state
resource "google_storage_bucket" "terraform_state" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project_id
  force_destroy = false

  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
}

# Grant the service account permissions on the bucket
resource "google_storage_bucket_iam_member" "sa_bucket_access" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${var.sa_name}@${var.project_id}.iam.gserviceaccount.com"
}
