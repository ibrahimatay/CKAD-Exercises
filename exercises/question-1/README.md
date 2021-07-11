# Question - 1

Create a new deployment for running.nginx with the following parameters;

- Create a namespace, the name is kdpd00201.
- Run the deployment in the kdpd00201 namespace. 
- Name the deployment frontend and configure with 4 replicas
- Configure the pod with a container image of lfccncf/nginx:1.13.7
- Set an environment variable of NGINX_PORT=8080 and also expose that port for the container above.

See the solution below.

## Step 1
```sh
kubectl create ns kdpd00201
namespace/kdpd00201 created


kubectl create deploy frontend --image=lfccncf/nginx:1.13.7 --port=8080 --namespace=kdpd00201 --replicas=4  --dry-run=client -o yaml
```

## Step 2
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: frontend
  name: frontend
  namespace: kdpd00201
spec:
  replicas: 4
  selector:
    matchLabels:
      app: frontend
  strategy: {}
  template:
    metadata:
      creationTimestamp: null      
      labels:
        app: frontend
    spec:
      containers:
      - image: lfccncf/nginx:1.13.7
        name: nginx
        ports:
        - containerPort: 8080      
        resources: {}
```

Step 3
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: frontend
  name: frontend
  namespace: kdpd00201
spec:
  replicas: 4
  selector:
    matchLabels:
      app: frontend
  strategy: {}
  template:
    metadata:
      creationTimestamp: null      
      labels:
        app: frontend
    spec:
      containers:
      - env: # modified level
        - name: NGINX_PORT
          value: "8080"
        image: lfccncf/nginx:1.13.7
        name: nginx
        ports:  
          - containerPort: 8080
```