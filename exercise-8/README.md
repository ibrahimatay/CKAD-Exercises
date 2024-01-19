# Exercise - 8

You are required to create a pod that requests a certain amount of CPU and memory, so it gets
scheduled to-a node that has those resources available.

- Create a pod named nginx-resources in the pod-resources namespace that requests a minimum of
200m CPU and 1Gi memory for its container
- The pod should use the nginx image
- The pod-resources namespace has already been created

# Solution

```sh
controlplane $ kubectl create ns pod-resources
namespace/pod-resources created

controlplane $ kubectl run nginx-resources --image=nginx --dry-run=client -o yaml > nginx-res.yaml

controlplane $ kubectl apply -f nginx-res.yaml 

```

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx-resources
  name: nginx-resources
  namespace: pod-resources
spec:
  containers:
  - image: nginx
    name: nginx-resources
    resources:
       requests:
        memory: "1Gi"
        cpu: "200m"  

```
