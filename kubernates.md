# Kubernetes Concepts

## Key Components

* **Namespace** is a logical partition allowing teams or projects to organize and manage resources like pods, services,
 config maps, and resource quotas independently within the same physical infrastructure.
* **Pod** is the smallest and simplest deployable unit, representing a single instance of a running process 
within a cluster. 
* **Cluster** is a group of nodes that run containerized applications in a highly available, scalable, and automated 
environment managed by a control plane.
* **Master node** manages the cluster – schedules workloads, maintains desired state, and handles API requests.
* **Worker node** run the actual application workloads (Pods).
* **API Server** is the entry point to the cluster, handles all communication.
* **Scheduler** Decides which node a pod should run on.
* **Controller Manager** Ensures the cluster state matches the desired configuration.
* **etcd** A key-value store that stores cluster configuration and state.
* **DaemonSet** ensures that a specific Pod runs on every (or selected) node in the cluster
* **ReplicaSet** ensures that a specified number of identical pods are running at all times to maintain availability 
and fault tolerance

##### 1. What are Kubernetes native deployments?
**Answer:**  Kubernetes natively supports two deployment strategies via the Deployment resource. 
1. Recreate - It is a clean deployment, terminate all the pods and recreate it. Simple but causes downtime.
2. Rolling Update 
~~~
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 1
~~~
We can implement manually Blue-Green, Canary, A/B, Shadow deployments.

##### 2. How to implement Blue-Green deployments in Kubernetes?
**Answer:** 
* Two separate Deployments. For example, blueapp and greenapp.
* Service routes traffic to one at a time.
* Switch traffic after verifying the new version.

##### 3. What is the difference between Rolling Update and Canary Deployment?
**Answer:** Rolling update gradually replaces all old pods with new ones in batches, while canary deployment slowly shifts a small portion of traffic to the new version to test before full rollout.

##### 4. How does Rolling Update works? 
**Answer:** With a Deployment, the rolling update strategy ensures some pods are updated while others stay running, maintaining availability:
 ~~~~ 
 rollingUpdate:
    maxSurge: 1 # Extra pods can be created during rolling update
    maxUnavailable: 1 # At max, one pod will be unavailable during rolling udpate.
~~~~
For 3 replicas, at least 2 pods will remain available during the update.

### Network Policies

Network Policies are a mechanism for controlling network traffic flow in Kubernetes clusters
There are three different ways to identify target endpoints:
* podSelector: Specific Pods (Pods matching a label are allowed)
* namespaceSelector: Specific Namespaces (all Pods in the namespace are allowed)
* ipBlock: IP address blocks (endpoints with an IP address in the block are allowed)

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
* Least Requested Resources (to pack efficiently) <br>
* Balanced Resource Allocation (CPU/memory balance) <br>
* Pod Affinity/Anti-Affinity Scores <br>
* Topology Spread (across zones, racks, nodes) <br>
* Custom Plugins (e.g., for GPU scheduling, biz rules) <br>

**Each node is given a weight-based score from 0 to 100. If multiple nodes have the same score, K8s breaks ties randomly to spread load.**

##### 3. A pod is stuck in CrashLoopBackOff. How would you investigate?
**Answer:** If a pod is stuck in CrashLoopBackOff, I start by checking the pod’s events and logs using kubectl describe 
and kubectl logs. I investigate for common causes like application errors, resource constraints (e.g., OOMKilled), 
liveness probe failures, or configuration issues. Based on findings, I might adjust resource limits, probe settings, or 
fix application/config bugs. For deeper debugging, I may override the command to start an interactive shell and explore 
the container manually.

##### 4. Your app is running fine, but requests are failing intermittently. What do you check?
**Answer:** When requests are failing intermittently despite the app running, I begin by checking pod logs and metrics
to look for timeouts, resource limits, or probe issues. I then inspect readiness and liveness probes, DNS and network 
behavior, and traffic routing via load balancers or ingress. I also evaluate whether downstream services (like DBs or 
external APIs) are causing the flakiness. Using tools like kubectl logs, top, and metrics dashboards, I narrow down the
root cause.

##### 5. You have a pod that must not be scheduled on the same node as another pod. How do you configure this?
**Answer** Use anti-affinity rules.

##### 6. What Are Affinity Rules in Kubernetes?
**Answer** Affinity rules control pod placement for performance, fault tolerance, or cost:


| Type                  | Description                                                                     |
| --------------------- | ------------------------------------------------------------------------------- |
| **Node Affinity**     | Controls which **nodes** a pod can be scheduled on (based on node labels)       |
| **Pod Affinity**      | Encourages pod to be scheduled on a node **with specific pods already running** |
| **Pod Anti-Affinity** | Encourages pod to be scheduled **away from specific pods** (on different nodes) |

Pod Affinity Example
Use case: Place frontend pods on the same node as backend pods (to reduce latency)
~~~~
affinity:
podAffinity:
requiredDuringSchedulingIgnoredDuringExecution:
- labelSelector:
matchLabels:
app: backend
topologyKey: "kubernetes.io/hostname"
~~~~

