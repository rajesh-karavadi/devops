

gcloud iam service-accounts create terraform-cicd-dev \
--display-name="Terraform CICD Dev Service Account" \
--description="Used by GitHub Actions to run Terraform in Dev"
Created service account [terraform-cicd-dev].

gcloud projects add-iam-policy-binding peerless-robot-426711-j3 \
--member="serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com" \
--role="roles/editor"

gcloud projects add-iam-policy-binding peerless-robot-426711-j3 \
--member="serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com" \
--role="roles/iam.serviceAccountUser"
Updated IAM policy for project [peerless-robot-426711-j3].
bindings:
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.admin
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.serviceAgent
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/artifactregistry.writer
- members:
    - serviceAccount:service-780205355835@compute-system.iam.gserviceaccount.com
      role: roles/compute.serviceAgent
- members:
    - serviceAccount:service-780205355835@containerregistry.iam.gserviceaccount.com
      role: roles/containerregistry.ServiceAgent
- members:
    - serviceAccount:780205355835-compute@developer.gserviceaccount.com
    - serviceAccount:780205355835@cloudservices.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/editor
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/iam.serviceAccountAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/iam.serviceAccountUser
- members:
    - user:rajesh.krvd@gmail.com
      role: roles/owner
- members:
    - serviceAccount:service-780205355835@gcp-sa-pubsub.iam.gserviceaccount.com
      role: roles/pubsub.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/resourcemanager.projectIamAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/run.admin
- members:
    - serviceAccount:service-780205355835@serverless-robot-prod.iam.gserviceaccount.com
      role: roles/run.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/storage.admin
      etag: BwY8QKSI4KE=
      version: 1
      Updated IAM policy for project [peerless-robot-426711-j3].
      bindings:
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.admin
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.serviceAgent
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/artifactregistry.writer
- members:
    - serviceAccount:service-780205355835@compute-system.iam.gserviceaccount.com
      role: roles/compute.serviceAgent
- members:
    - serviceAccount:service-780205355835@containerregistry.iam.gserviceaccount.com
      role: roles/containerregistry.ServiceAgent
- members:
    - serviceAccount:780205355835-compute@developer.gserviceaccount.com
    - serviceAccount:780205355835@cloudservices.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/editor
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/iam.serviceAccountAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/iam.serviceAccountUser
- members:
    - user:rajesh.krvd@gmail.com
      role: roles/owner
- members:
    - serviceAccount:service-780205355835@gcp-sa-pubsub.iam.gserviceaccount.com
      role: roles/pubsub.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/resourcemanager.projectIamAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/run.admin
- members:
    - serviceAccount:service-780205355835@serverless-robot-prod.iam.gserviceaccount.com
      role: roles/run.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/storage.admin
      etag: BwY8QKTTHrE=
      version: 1

gcloud services enable iam.googleapis.com iamcredentials.googleapis.com storage.googleapis.com compute.googleapis.com
Operation "operations/acat.p2-780205355835-7ae0baf8-1cd7-46ab-864c-c946006e85b3" finished successfully.

gcloud iam service-accounts add-iam-policy-binding terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com \
--role="roles/iam.workloadIdentityUser" \
--member="principalSet://iam.googleapis.com/projects/780205355835/locations/global/workloadIdentityPools/github-pool/attribute.repository/rajesh-karavadi/devops"      
Updated IAM policy for serviceAccount [terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com].
bindings:
- members:
    - principalSet://iam.googleapis.com/projects/780205355835/locations/global/workloadIdentityPools/github-pool/attribute.repository/rajesh-karavadi/devops
      role: roles/iam.workloadIdentityUser
      etag: BwY8QKjsGE4=
      version: 1
      
gcloud iam workload-identity-pools providers describe github-provider \
      --project=peerless-robot-426711-j3 \
      --location=global \
      --workload-identity-pool=github-pool \
      --format="value(name)"
      projects/780205355835/locations/global/workloadIdentityPools/github-pool/providers/github-provider

gcloud iam service-accounts add-iam-policy-binding \
terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com \
--project=peerless-robot-426711-j3 \
--role="roles/iam.workloadIdentityUser" \
--member="principalSet://iam.googleapis.com/projects/780205355835/locations/global/workloadIdentityPools/github-pool/attribute.repository/rajesh-karavadi/devops"      
Updated IAM policy for serviceAccount [terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com].
bindings:
- members:
    - principalSet://iam.googleapis.com/projects/780205355835/locations/global/workloadIdentityPools/github-pool/attribute.repository/rajesh-karavadi/devops
      role: roles/iam.workloadIdentityUser
      etag: BwY8QgJkFh0=
      version: 1

gcloud iam workload-identity-pools providers describe github-provider \
--project=peerless-robot-426711-j3 \
--location=global \
--workload-identity-pool=github-pool
attributeCondition: attribute.repository=='rajesh.krvd/devops'
attributeMapping:
attribute.repository: assertion.repository
google.subject: assertion.sub
displayName: GitHub Actions OIDC Provider
name: projects/780205355835/locations/global/workloadIdentityPools/github-pool/providers/github-provider
oidc:
issuerUri: https://token.actions.githubusercontent.com
state: ACTIVE

gcloud iam service-accounts get-iam-policy terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com \
--project=peerless-robot-426711-j3
bindings:
- members:
    - principalSet://iam.googleapis.com/projects/780205355835/locations/global/workloadIdentityPools/github-pool/attribute.repository/rajesh-karavadi/devops
      role: roles/iam.workloadIdentityUser
      etag: BwY8QgJkFh0=
      version: 1

gcloud iam workload-identity-pools providers describe github-provider \
--location=global \
--workload-identity-pool=github-pool \
--project=peerless-robot-426711-j3
attributeCondition: attribute.repository=='rajesh-karavadi/devops'
attributeMapping:
attribute.repository: assertion.repository
google.subject: assertion.sub
displayName: GitHub Actions OIDC Provider
name: projects/780205355835/locations/global/workloadIdentityPools/github-pool/providers/github-provider
oidc:
issuerUri: https://token.actions.githubusercontent.com
state: ACTIVE


or to update..
gcloud iam workload-identity-pools providers update-oidc github-provider \
--location=global \
--workload-identity-pool=github-pool \
--attribute-condition="attribute.repository == 'rajesh-karavadi/devops'" \
--project=peerless-robot-426711-j3
Updated workload identity pool provider [github-provider].
name: projects/780205355835/locations/global/workloadIdentityPools/github-pool/providers/github-provider/operations/bigarimt6pcamehywoq5iaq000000000


gcloud projects add-iam-policy-binding peerless-robot-426711-j3 \
--member="serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com" \
--role="roles/run.admin"

# Allow it to act as the Cloud Run service account (needed for deploy)
gcloud projects add-iam-policy-binding peerless-robot-426711-j3 \
--member="serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com" \
--role="roles/iam.serviceAccountUser"
Updated IAM policy for project [peerless-robot-426711-j3].
bindings:
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.admin
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.serviceAgent
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/artifactregistry.writer
- members:
    - serviceAccount:service-780205355835@compute-system.iam.gserviceaccount.com
      role: roles/compute.serviceAgent
- members:
    - serviceAccount:service-780205355835@containerregistry.iam.gserviceaccount.com
      role: roles/containerregistry.ServiceAgent
- members:
    - serviceAccount:780205355835-compute@developer.gserviceaccount.com
    - serviceAccount:780205355835@cloudservices.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/editor
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/iam.serviceAccountAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/iam.serviceAccountUser
- members:
    - user:rajesh.krvd@gmail.com
      role: roles/owner
- members:
    - serviceAccount:service-780205355835@gcp-sa-pubsub.iam.gserviceaccount.com
      role: roles/pubsub.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/resourcemanager.projectIamAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/run.admin
- members:
    - serviceAccount:service-780205355835@serverless-robot-prod.iam.gserviceaccount.com
      role: roles/run.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/storage.admin
      etag: BwY8Q0wp7qo=
      version: 1
      Updated IAM policy for project [peerless-robot-426711-j3].
      bindings:
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.admin
- members:
    - serviceAccount:service-780205355835@gcp-sa-artifactregistry.iam.gserviceaccount.com
      role: roles/artifactregistry.serviceAgent
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/artifactregistry.writer
- members:
    - serviceAccount:service-780205355835@compute-system.iam.gserviceaccount.com
      role: roles/compute.serviceAgent
- members:
    - serviceAccount:service-780205355835@containerregistry.iam.gserviceaccount.com
      role: roles/containerregistry.ServiceAgent
- members:
    - serviceAccount:780205355835-compute@developer.gserviceaccount.com
    - serviceAccount:780205355835@cloudservices.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/editor
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/iam.serviceAccountAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/iam.serviceAccountUser
- members:
    - user:rajesh.krvd@gmail.com
      role: roles/owner
- members:
    - serviceAccount:service-780205355835@gcp-sa-pubsub.iam.gserviceaccount.com
      role: roles/pubsub.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
      role: roles/resourcemanager.projectIamAdmin
- members:
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
    - serviceAccount:terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/run.admin
- members:
    - serviceAccount:service-780205355835@serverless-robot-prod.iam.gserviceaccount.com
      role: roles/run.serviceAgent
- members:
    - deleted:serviceAccount:terraform-bootstrap@peerless-robot-426711-j3.iam.gserviceaccount.com?uid=103303276800277675908
    - serviceAccount:github-actions-deployer@peerless-robot-426711-j3.iam.gserviceaccount.com
      role: roles/storage.admin
      etag: BwY8Q0yRRBw=
      version: 1

gcloud run services describe gcp-sentiment-api --region=us-east1 --project=peerless-robot-426711-j3
+ Service gcp-sentiment-api in region us-east1
  goog-terraform-provisioned:true

URL:     https://gcp-sentiment-api-780205355835.us-east1.run.app
Ingress: all
Traffic:
100% LATEST (currently gcp-sentiment-api-00001-7hc)

Scaling: Auto (Min: 0)

Last updated on 2025-08-13T18:23:55.709577Z by terraform-cicd-dev@peerless-robot-426711-j3.iam.gserviceaccount.com:
Revision gcp-sentiment-api-00001-7hc
Container None
Image:           docker.io/rajeshkrvd/gcp-sentiment-api:1.1.6
Port:            8080
Memory:          512Mi
CPU:             1000m
Startup Probe:
TCP every 240s
Port:          8080
Initial delay: 0s
Timeout:       240s
Failure threshold: 1
Type:          Default
Service account:   780205355835-compute@developer.gserviceaccount.com
Concurrency:       80
Max instances:     3
Timeout:           300s



