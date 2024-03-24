# Exercise - 5

A project that you are working on has a requirement for persistent data to be available.

- Create a file on node sk8s-node-0 at index.html with the content Acct=Finance
- Create a PersistentVolume named task-pv-volume using hostPath and allocate 1Gi to it, specifying that the volume is at /opt/KDSP00101/data on the cluster's node. The configuration should specify the access mode of ReadWriteOnce - It should define the StorageClass name exam for the PersistentVolume, which will be used to bind PersistentVolumeClaim requests to this PersistentVolume.
- Create a PersistentVolumeClaim named task-pv-claim that requests a volume of at least 100Mi and specifies an access mode of ReadWriteOnce
- Create a pod that uses the PersistentVolumeClaim as a volume with a label app: my-storage-app mounting the resulting volume to a mountPath
/usr/share/nginx/html inside the pod

# Solution

## Step 1
```sh
echo Acct=Finance > index.html

cat .\index.html
Acct=Finance
```

## Step 2

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: task-pvc-volume
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi
```

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: task-pv-volume
spec:
  claimRef: # binding to claim
    name: task-pvc-volume
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  storageClassName: storage
  hostPath:
    path: /opt/KDSP00101/data
    type: Directory
```

## Step 3

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: my-storage-app
spec:
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - name: html
      mountPath: /usr/share/nginx/html
  volumes:
  - name: html
    persistentVolumeClaim:
      claimName: task-pvc-volume
```

# Reference
- [Create a PersistentVolumeClaim](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim)
- [Why does a match Persistent Volume not bind to a match Persistent Volume Claim (using k3s)? - Stackoverflow](https://stackoverflow.com/questions/66042100/why-does-a-match-persistent-volume-not-bind-to-a-match-persistent-volume-claim)
