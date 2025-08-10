project_id            = "peerless-robot-426711-j3"
region                = "us-east1"
app_name              = "gcp-sentiment-api"
image                 = "docker.io/rajeshkrvd/gcp-sentiment-api:1.1.6"
cicd_sa_email         = "terraform-cicd@peerless-robot-426711-j3.iam.gserviceaccount.com"
invoke_member         = "allUsers"
invoke_role           = "roles/run.invoker"
role_permissions      = [ "run.services.create","run.services.update" ]