## Sample Project for Uploading HTML to Google Cloud Storage

### This project demonstrates how to deploy a static HTML website to **Google Cloud Storage (GCS)** using **Terraform** and **GitHub Actions**.

1. Provision Infrastructure using Terraform
2. Upload HTML Files to a GCP Storage Bucket

Project Structure:

gcp-static-website/
├── infra/ # Terraform files to provision GCS bucket
│ └── terraform.tfvars # Variables including project_id and bucket_name
└── src/ # Static HTML files to upload to GCS

---

## 🚀 CI/CD Overview

This repository includes two GitHub Actions workflows:

### 1. ✅ Infrastructure Workflow — `Run Infra for GCP Static Website`

**Path**: `.github/workflows/infra.yml`

**Purpose**: Provisions or destroys the GCP infrastructure (GCS bucket) using Terraform.

**Triggers**:
- Push to `main` affecting `gcp-static-website/infra/**`
- Manual trigger via **workflow_dispatch** (`apply` or `destroy`)

**Key Features**:
- Initializes and plans Terraform
- Imports existing bucket if already created
- Applies or destroys infrastructure based on user input
- Auto-applies on code push for seamless integration

### 2. 🌍 Deployment Workflow — `Code Deploy Static Website`

**Path**: `.github/workflows/deploy.yml`

**Purpose**: Uploads static HTML content to the GCS bucket.

**Triggers**:
- Push to `main` branch

**Key Features**:
- Authenticates to Google Cloud using a service account key stored as a GitHub Secret (`GCP_CREDENTIALS`)
- Extracts project and bucket names from `terraform.tfvars`
- Uploads static files to GCS with `Cache-Control: public, max-age=0` to prevent caching issues

---

## ⚙️ How to Use

### 1. 🔐 Setup GitHub Secrets

Add the following secret to your GitHub repo:

- `GCP_CREDENTIALS`: JSON key for a GCP service account with `Storage Admin` and `Terraform` permissions

### 2. 📦 Deploy Infrastructure

Run the **"Run Infra for GCP Static Website"** workflow:

- Choose `apply` to provision the GCS bucket
- Choose `destroy` to tear it down

> This can also be triggered automatically on push to `infra/`

### 3. 🌐 Upload HTML Files

Push your HTML updates to the `src/` folder on the `main` branch to trigger the **"Code Deploy Static Website"** workflow.

Files will be uploaded to the GCS bucket with cache-busting headers.

---

## 📌 Notes

- Ensure your `terraform.tfvars` contains valid `project_id` and `bucket_name`
- Deletion and re-upload may be needed to reflect changes due to caching (use the built-in delete logic if needed)
- Use versioning or content hashing if cache invalidation becomes critical

---

## 📄 License

This project is licensed under the MIT License.


