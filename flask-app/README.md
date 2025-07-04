

**Prerequisite**: 
* DockerDesktop is running

#### Install ArgoCD into argocd namespace. 
~~~~
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
~~~~

### Apply k8s 

~~~~
k apply -f flask-app/k8s/
~~~~

### Check ArgoCD installed or not.
~~~~
$ kubectl get crd applications.argoproj.io
NAME                       CREATED AT
applications.argoproj.io   2025-07-04T18:24:36Z
~~~~

#### Run ArgoCD 

~~~~
$ kubectl port-forward svc/argocd-server -n argocd 9090:443
Forwarding from 127.0.0.1:9090 -> 8080
Forwarding from [::1]:9090 -> 8080
~~~~
* In your browser, access localhost:9090 to see ArgoCD applications.

~~~~
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
<<pwd will be printed here>>
~~~~
* Use the password from here to login ArgoCD for Username `admin`
