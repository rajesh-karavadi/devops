# Kubernates Concepts
## Frequently Asked Questions

##### 1. What are Kubernates native deployments?
**Answer:**  Kubernetes natively supports two deployment strategies via the Deployment resource. 
1. Recreate - It is a clean deployment, terminate all the pods and recreate it.
2. Rolling Update <br>
We can implement manually Blue-Green, Canary, A/B, Shadow deployments. 
##### 2. How to implement Blue-Green deployments in Kubernates?
**Answer:** 
* Two separate Deployments. For example, blueapp and greenapp.
* Service routes traffic to one at a time.
* Switch traffic after verifying the new version.
##### 3. What is the difference between Rollout and Canary Deployment?
**Answer:** Rolling update gradually replaces all old pods with new ones in batches, while canary deployment slowly shifts a small portion of traffic to the new version to test before full rollout.
##### 4. How Rolling Update works? 
**Answer:** when there are 3 replicas, at any time 2 pods will be available as per the below configuration. 
 ~~~~ 
 rollingUpdate:
    maxSurge: 1 # Extra pods can be created during rolling update
    maxUnavailable: 1 # At max, one pod will be unavailable during rolling udpate.
