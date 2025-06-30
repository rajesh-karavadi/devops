##### Steps to Deploy blue and green app

~~~
* kubectl apply -f blue\deployment.yaml
* kubectl apply -f green\deployment.yaml
* kubectl apply -f service\service.yaml

* kubectl patch service my-app-service -p '{"spec":{"selector":{"app":"my-app","version":"green"}}}'
~~~

Note: Use linux interpreter in Intelli.
 ~~~ 
 wsl --install 
 ~~~
 
 Then change Settings -> Tools -> Interpreter to C:\Program Files\Git\bin\bash.exe

kubectl port-forward svc/my-app-service 8080:80

try localhost:8080 from browser or do curl localhost:8080

Check green pod logs.

~~~
'kubectl logs <green-pod>'
~~~
