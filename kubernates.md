# Kubernates Concepts
## Frequently Asked Questions

##### 1. What are Kubernates native deployments?
**Answer:**  Kubernetes natively supports two deployment strategies via the Deployment resource. 
1. Recreate - It is a clean deployment, terminate all the pods and recreate it.
2. Rolling Update <br>
We can implement manually Blue-Green, Canary, A/B, Shadow deployments. 
##### 2. How to implement Blue-Green deployments in Kubernates?
**Answer:** 
* Two separate Deployments. For example, blue and green.
* Service routes traffic to one at a time.
* Switch traffic after verifying the new version.
