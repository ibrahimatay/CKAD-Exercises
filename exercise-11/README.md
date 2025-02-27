# Exercise - 11

You have rolled out a new pod to your infrastructure and now you need to allow it to communicate with the web and storage pods but nothing else. Given the running pod kdsn00201 -newpod edit it to use a network policy that will allow it to send and receive traffic only to and from the web and storage pods.

# Solution

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-newpod-web-storage
  namespace: default  # Change if your pod is in a different namespace
spec:
  podSelector:
    matchLabels:
      app: newpod  # Ensure this matches the labels of kdsn00201-newpod
  policyTypes:
    - Ingress
    - Egress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: web
        - podSelector:
            matchLabels:
              app: storage
  egress:
    - to:
        - podSelector:
            matchLabels:
              app: web
        - podSelector:
            matchLabels:
              app: storage
```
