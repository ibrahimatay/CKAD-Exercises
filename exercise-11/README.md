# Exercise - 11
A pod is running on the cluster but it is not responding.

The desired behavior is to have k8s reset the pod when an endpoint returns an HTTP 500 on the /healthz endpoint. The service probe-pod, should never send traffic to the pod while it is failing. Please complete the following:

- The application has another endpoint /healthz that will indicate if the application is still working as expected by returning as HTTP 200. If the endpoint returns as HTTP 500 the application is no longer responsive.
- Configure the probe-pod pod provided to use these endpoints.
- The probes should use port 8080.

# Solution

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-exec
spec:
  containers:
  - name: liveness
    image: k8s.gcr.io/busybox
    args:
    - /bin/sh
    - -c
    - touch /tmp/healthy; sleep 30; rm -f /tmp/healthy; sleep 600
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5

```