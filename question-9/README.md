# Question - 9

You are tasked to create a ConfigMap and consume the ConfigMap in a pod using a volume mount.

- Create a ConfigMap named another-config containing the key/value pair: key4/value3
- start a pod named nginx-configmap containing a single container using the nginx image, and mount the key you just created into the pod under directory /also/a/path

# Solution

```sh
controlplane $ kubectl create configmap another-config --from-literal=key4=value3
configmap/another-config created

controlplane $ kubectl run nginx-configmap --image=nginx --dry-run=client -o yaml > nginx-configmap.yaml
controlplane $ vi nginx-configmap.yaml 

controlplane $ kubectl create -f nginx-configmap.yaml 

```

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx-configmap
  name: nginx-configmap
spec:
  containers:
  - image: nginx
    name: nginx-configmap
    volumeMounts:
    - name: my-volume
      mountPath: /also/a/path
  volumes:
  - name: my-volume
      configMap:
        name: another-config
```