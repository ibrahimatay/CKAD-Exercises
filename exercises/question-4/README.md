# Question - 4

Anytime a team needs to run a container on Kubernetes they will need to define a pod within which to run the container.

- Create a YAML formatted pod manifest pod.yml to create a pod named app1 that runs a container named app1cont using image Ifccncf/arg-output with these command line arguments: -lines 56 -F
- Create the pod with the kubect1 command using the YAML file created in the previous step
- When the pod is running display summary data about the pod in JSON format using the kubect1 command and redirect the output to a file named out1.json
- All of the files you need to work with have been created, empty, for your convenience

## Step 1
```sh
kubectl run app1 --image=Ifccncf/arg-output --dry-run=client -o yaml
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null    
  labels:
    run: app1
  name: app1
spec:
  containers:
  - image: Ifccncf/arg-output
    name: app1
    resources: {}
  dnsPolicy: ClusterFirst    
  restartPolicy: Always      
status: {}
```

## Step 2
```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null    
  labels:
    run: app1
  name: app1
spec:
  containers:
  - image: Ifccncf/arg-output
    name: app1
    args: ["-lines", "56", "-F"]
```

```sh
kubectl create -f .\app1-pod.yaml  
```

## Step 3
```sh
kubectl get po app1 mage=Ifccncf/arg-outp
-o json > app1.json
```