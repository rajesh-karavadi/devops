# Kubernates Concepts
### Deployments
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
##### 3. What is the difference between Rolling Update and Canary Deployment?
**Answer:** Rolling update gradually replaces all old pods with new ones in batches, while canary deployment slowly shifts a small portion of traffic to the new version to test before full rollout.
##### 4. How Rolling Update works? 
**Answer:** When there are 3 replicas, at any time 2 pods will be available as per the below configuration. 
 ~~~~ 
 rollingUpdate:
    maxSurge: 1 # Extra pods can be created during rolling update
    maxUnavailable: 1 # At max, one pod will be unavailable during rolling udpate.
~~~~
### Network Policies
##### 1. Can we enforce Network Policies from Pod to Service?
**Answer:** Network Policies apply specifically to **pod-to-pod communication** within a Kubernetes cluster. You can manage **incoming traffic** to pods using **Ingress rules** and **outgoing traffic** from pods using **Egress rules**.

### Advanced
##### 1. How does the Kubernetes Scheduler Work?
**Answer:** Kubernetes Scheduler is a core control plane component responsible for assigning Pods to Nodes.

When a new Pod is created (e.g., via Deployment), it is unscheduled — meaning it has no nodeName. The scheduler's job is to:

* Watch for unscheduled pods
* Find the best node for each pod
* Bind the pod to that node by updating the PodSpec.nodeName

##### 2. How Kubernetes Finds the Best Node for a Pod?
**Answer:**
Kubernetes finds the best node by first filtering out all nodes that don’t meet hard requirements (like resources or 
labels), and then scoring the remaining nodes based on configurable heuristics. The node with the highest score is 
chosen, and the Pod is bound to it.

1. *Filtering Phase* to eliminate all nodes that are not suitable.
   CPU and Memory Request, Volume requests,
2. *Scoring Phase* <br>
   3. Least Requested Resources (to pack efficiently) <br>
   4. Balanced Resource Allocation (CPU/memory balance) <br>
   5. Pod Affinity/Anti-Affinity Scores <br>
   6. Topology Spread (across zones, racks, nodes) <br>
   7. Custom Plugins (e.g., for GPU scheduling, biz rules) <br>

   Each node is given a weight-based score from 0 to 100. If multiple nodes have the same score, K8s breaks ties randomly to spread load.



