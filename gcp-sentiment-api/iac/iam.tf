resource "google_storage_bucket" "terraform_state_meta_logs" {
  name                        = "${var.bucket_name}-meta-logs"
  location                    = var.bucket_location
  uniform_bucket_level_access = true
  force_destroy               = false
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  logging {
    log_bucket        = google_storage_bucket.terraform_state_meta_logs.name
    log_object_prefix = "logs-for-log-bucket"
  }
}

##########################
# Log Bucket (stores access logs for the state bucket)
##########################
resource "google_storage_bucket" "terraform_state_logs" {
  name                        = "${var.bucket_name}-logs"
  location                    = var.bucket_location
  uniform_bucket_level_access = true
  force_destroy               = false
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  # Log its own access into the meta logs bucket (prevents Checkov CKV_GCP_62 on this resource).
  logging {
    log_bucket        = google_storage_bucket.terraform_state_meta_logs.name
    log_object_prefix = "logs-for-log-bucket"
  }
}

##########################
# Terraform State Bucket (stores Terraform state)
##########################
resource "google_storage_bucket" "terraform_state" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  uniform_bucket_level_access = true
  force_destroy               = false
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  # Send access logs to the log bucket
  logging {
    log_bucket        = google_storage_bucket.terraform_state_logs.name
    log_object_prefix = "access-logs"
  }
}

##########################
# IAM: GCS minimal roles for Terraform backend
# These are bucket-level bindings granting the CI/CD SA what Terraform's backend needs:
# - storage.objectViewer  (list/read)
# - storage.objectCreator (write)
# - storage.legacyBucketReader (bucket listing in some setups)
##########################
resource "google_storage_bucket_iam_member" "cicd_sa_object_viewer" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${var.cicd_sa_email}"
}

resource "google_storage_bucket_iam_member" "cicd_sa_object_creator" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.objectCreator"
  member = "serviceAccount:${var.cicd_sa_email}"
}

resource "google_storage_bucket_iam_member" "cicd_sa_legacy_bucket_reader" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.legacyBucketReader"
  member = "serviceAccount:${var.cicd_sa_email}"
}

##########################
# Custom Cloud Run Role & assignment
##########################
resource "google_project_iam_custom_role" "cicd_run_deployer" {
  project     = var.project_id
  role_id     = "cicdRunDeployer"
  title       = "CI/CD Run Deployer"
  description = "Custom role for deploying to Cloud Run"
  permissions = var.deployer_permissions
}

resource "google_project_iam_member" "assign_cicdRunDeployer" {
  project    = var.project_id
  role       = google_project_iam_custom_role.cicd_run_deployer.name
  member     = "serviceAccount:${var.cicd_sa_email}"
  depends_on = [google_project_iam_custom_role.cicd_run_deployer]
}

##########################
# Cloud Run invoker restriction (keeps your existing restriction)
# Assumes google_cloud_run_service.default exists elsewhere in your TF.
##########################
resource "google_cloud_run_service_iam_member" "user_invoker" {
  service  = google_cloud_run_service.default.name
  location = var.region
  role     = var.invoker_role
  member   = var.invoker
}