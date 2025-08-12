# 4. Output the key so you can save it as a GitHub Secret
# output "terraform_cicd_key_json" {
#   sensitive = true
#   value     = google_service_account_key.terraform_cicd_key.private_key
# }

output "terraform_cicd_email" {
  value = google_service_account.terraform_cicd.email
}