# Exercise - 6

You are tasked to create a ConfigMap and consume the ConfigMap in a pod using a volume mount.

- Create a ConfigMap namedanother-config containing the key/value pair: key4/value3
- start a pod named nginx-configmap containing a single container using the nginx image, and mount the key you just created into the pod under directory /also/a/path

# Solution

## Step 1

```sh
kubectl create configmap namedanother-config --from-literal=key4=value3

kubectl get cm namedanother-config
NAME                  DATA   AGE
namedanother-config   1      13m

kubectl describe  cm namedanother-config
Name:         namedanother-config
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
key4:
----
value
Events:  <none>
```

## Step 2

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
    resources: {}        
    volumeMounts:
    - mountPath: /also/a/path
      name: nginx-configmap-volume
  volumes:
    - name: nginx-configmap-volume
      configMap:
        name: namedanother-config
  dnsPolicy: ClusterFirst
  restartPolicy: Always 
  ```

```sh
kubectl create -  cm namedanother-configf .\nginx-configmap-po.yaml
pod/nginx-configmap created
```