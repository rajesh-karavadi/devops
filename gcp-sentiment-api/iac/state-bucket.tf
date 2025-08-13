
# Bucket to store logs for the Terraform state bucket
# resource "google_storage_bucket" "terraform_state_logs" {
#   name                        = "${var.project_id}-tfstate-logs"
#   location                    = "US"
#   storage_class               = "STANDARD"
#   uniform_bucket_level_access = true
#   public_access_prevention    = "enforced"
#
#   versioning {
#     enabled = true
#   }
#
#   lifecycle_rule {
#     condition {
#       age = 90
#     }
#     action {
#       type = "Delete"
#     }
#   }
#   logging {
#     log_bucket = "mylovelybucket"
#   }
# }

# Create GCS bucket for remote state
# resource "google_storage_bucket" "terraform_state" {
#   name          = "${var.project_id}-tfstate"
#   location      = var.location
#   project       = var.project_id
#   force_destroy = false
#
#   uniform_bucket_level_access = true
#
#   public_access_prevention = "enforced"
#   logging {
#     log_bucket        = google_storage_bucket.terraform_state_logs.name
#     log_object_prefix = "access-logs"
#   }
#   versioning {
#     enabled = true
#   }
# }

# Grant the service account permissions on the bucket
resource "google_storage_bucket_iam_member" "sa_bucket_access" {
  bucket = "${var.project_id}-tfstate"
  role   = "roles/storage.${var.storage_role}"
  member = "serviceAccount:${var.sa_name}@${var.project_id}.iam.gserviceaccount.com"
}
