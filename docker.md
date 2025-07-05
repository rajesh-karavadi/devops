**Docker Interview Questions and Answers**

---

### 1. **What is Docker? How is it different from a virtual machine?**

**Answer:** Docker is a platform for developing, shipping, and running applications in containers. Unlike virtual machines, containers share the host OS kernel and are more lightweight, leading to faster startup and lower resource usage.

---

### 2. **What is the difference between an image and a container?**

**Answer:** An image is a read-only template used to create containers. A container is a runnable instance of an image that includes the application and its dependencies.

---

### 3. **What is a Dockerfile?**

**Answer:** A Dockerfile is a script containing instructions to build a Docker image. It defines the base image, packages, environment variables, and commands to run inside the container.

---

### 4. **What is Docker Compose?**

**Answer:** Docker Compose is a tool for defining and running multi-container Docker applications using a `docker-compose.yml` file.

---

### 5. **How do you build and run a Docker container?**

**Answer:**

```bash
docker build -t myapp .
docker run -p 8080:80 myapp
```

---

### 6. **What is the difference between CMD and ENTRYPOINT?**

**Answer:**

* `CMD` sets default command and arguments that can be overridden
* `ENTRYPOINT` sets a fixed command and allows additional arguments via `CMD`

---

### 7. **What are Docker volumes?**

**Answer:** Docker volumes are persistent storage that exists outside the container lifecycle, used to store data generated and used by containers.

---

### 8. **What are Docker networks?**

**Answer:** Docker provides isolated networks (bridge, host, overlay) to allow communication between containers securely and flexibly.

---

### 9. **How does Docker differ from containerd?**

**Answer:** Docker is a complete platform that includes containerd under the hood. containerd is a container runtime responsible for managing container lifecycle without the CLI or image building features.

---

### 10. **How do you debug a Docker container?**

**Answer:**

```bash
docker exec -it <container_id> /bin/bash
docker logs <container_id>
```

---

### 11. **What are some best practices for writing Dockerfiles?**

**Answer:**

* Use small base images (like Alpine)
* Minimize layers
* Use `.dockerignore`
* Use multi-stage builds
* Avoid running as root

---

### 12. **What is Docker Swarm?**

**Answer:** Docker Swarm is Docker's native clustering and orchestration tool for managing a group of Docker nodes as a single virtual system.

---

### 13. **How do you secure Docker containers?**

**Answer:**

* Use official base images
* Run containers as non-root
* Use Docker Content Trust (DCT)
* Scan images (e.g., Trivy)
* Isolate containers with user namespaces

---

### 14. **What are multi-stage builds in Docker?**

**Answer:** Multi-stage builds allow you to use multiple `FROM` statements in a Dockerfile to optimize the final image by copying only needed artifacts from builder stages.

---

### 15. **How do you manage secrets in Docker?**

**Answer:** In Swarm mode, you can use `docker secret`. In standalone mode, mount secret files or use environment variables (not recommended for sensitive info).

---

### 16. **How do you store and pull images from Docker Hub?**

**Answer:**

```bash
docker login
docker push <username>/<image>:tag
docker pull <username>/<image>:tag
```

---

### 17. **What’s the difference between `COPY` and `ADD` in Dockerfile?**

**Answer:**

* `COPY`: Only copies local files
* `ADD`: Can also fetch remote URLs and unpack compressed files

**Examples:** 
1. ADD https://example.com/script.sh /usr/local/bin/script.sh
2. ADD config.tar.gz /etc/config/

---

### 18. **What is a bind mount vs a volume?**

**Answer:**

* **Bind mount:** Direct mapping of a host path
* **Volume:** Managed by Docker; safer and more portable

---

### 19. **How do you automate Docker builds in CI/CD?**

**Answer:** Use tools like GitHub Actions, GitLab CI, or Jenkins to build Docker images and push to a registry. You can then deploy using `kubectl`, ArgoCD, or Flux.

---

### 20. **What would you do if a container keeps crashing?**

**Answer:**

* Check logs with `docker logs`
* Inspect container health and resource usage
* Debug with `docker exec` or rebuild with better entrypoint handling

---

### 21. What are Cgroups in Kubernetes
* Kubernetes uses cgroups to enforce requests and limits:

~~~~
resources:
    requests:
        memory: "256Mi"
        cpu: "500m"
    limits:
        memory: "512Mi"
        cpu: "1"
~~~~
* These translate directly to cgroup configurations on the worker node.

### 21. Difference between GCP CloudRun Vs AWS Lambda
* **Cloud Run** is serverless for containers,
* **Lambda** is serverless for functions.
