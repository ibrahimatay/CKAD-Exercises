# Question - 3

You are tasked to create a secret and consume the secret in a pod using environment variables as follow;

- Create a secret named another-secret with a key/value pair; key1/value4
- Start an nginx pod named nginx-secret using container image nginx, and add an environment variable exposing the value of the secret key key 1,
using COOL_VARIABLE as the name for the environment variable inside the pod

## Step 1
```sh
kubectl create secret generic another-secret  --from-literal=key1=value4       
secret/another-secret created
```

## Step 2
```sh
kubectl run nginx-secret --image=nginx --dry-run=client -o yaml
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx-secret    
  name: nginx-secret     
spec:
  containers:
  - image: nginx
    name: nginx-secret   
    resources: {}        
  dnsPolicy: ClusterFirst
  restartPolicy: Always  
```

## Step 3
```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx-secret    
  name: nginx-secret     
spec:
  containers:
  - image: nginx
    name: nginx-secret  
    env: # added this section
      - name: COOL_VARIABLE
        valueFrom:
          secretKeyRef:
            name: another-secret
            key: key1 
    resources: {}        
  dnsPolicy: ClusterFirst
  restartPolicy: Always  
```

## Reference
- [Using Secrets as environment variables](https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables)
