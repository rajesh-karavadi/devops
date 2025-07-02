Started this example to test ArgoCD feature. 

ArgoCD local it works. Need to practise more on it locally. 

But, this example covers create a docker image and push to Docker Hub. 

~~~~
 kubectl port-forward svc/argocd-server -n argocd 8080:443
 


~~~~

~~~~
rajes@DESKTOP-RREJEG8 MINGW64 /c/MyWorkspace/devops (main)
$ argocd app list
NAME            CLUSTER                         NAMESPACE  PROJECT  STATUS   HEALTH   SYNCPOLICY  CONDITIONS       REPO                                           PATH  TARGET
argocd/web-app  https://kubernetes.default.svc  default    default  Unknown  Healthy  Auto-Prune  ComparisonError  https://github.com/rajesh_karavadi/devops.git  k8s   main

rajes@DESKTOP-RREJEG8 MINGW64 /c/MyWorkspace/devops (main)
$ argocd context
CURRENT  NAME            SERVER
*        localhost:8080  localhost:8080

git ls-remote https://github.com/rajesh-karavadi/devops.git
fd100766fb3939e7abe3ff3c160181f0c62c802a        HEAD
fd100766fb3939e7abe3ff3c160181f0c62c802a        refs/heads/main

rajes@DESKTOP-RREJEG8 MINGW64 /c/MyWorkspace/devops (main)
$ argocd repo add https://github.com/rajesh-karavadi/devops.git   --username rajesh.karavadi   --password <pwd>
Repository 'https://github.com/rajesh-karavadi/devops.git' added
~~~~