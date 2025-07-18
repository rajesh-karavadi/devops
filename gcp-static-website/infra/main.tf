provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "static_site" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_object" "index" {
  name   = "index.html"
  bucket = google_storage_bucket.static_site.name
  source = "${path.module}/../src/index.html"
  content_type = "text/html"
}

resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.static_site.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}