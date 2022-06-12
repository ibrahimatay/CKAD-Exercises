# Exercise - 2

You sometimes need to observe a pod's logs and write those logs to a file for further analysis.

- Deploy the counter pod to the cluster using the provided YAML spec file at counter.yaml
- Retrieve all currently available application logs from the running pod and store them in the file
log_Output.txt, which has already been created

# Solution

## Step 1
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: counter
spec:
  containers:
  - name: busybox
    image: busybox
    args: [/bin/sh, -c, 'while true; do echo $(date); sleep 1; done']

```
## Step 2
```sh
kubectl create -f .\counter.yaml
pod/counter created
```
## Step 3
```sh
kubectl logs counter
Sat Jul 10 16:04:12 UTC 2021
Sat Jul 10 16:04:13 UTC 2021
Sat Jul 10 16:04:14 UTC 2021
Sat Jul 10 16:04:15 UTC 2021
Sat Jul 10 16:04:16 UTC 2021
Sat Jul 10 16:04:17 UTC 2021
Sat Jul 10 16:04:18 UTC 2021
Sat Jul 10 16:04:19 UTC 2021
Sat Jul 10 16:04:20 UTC 2021
Sat Jul 10 16:04:21 UTC 2021
Sat Jul 10 16:04:22 UTC 2021
Sat Jul 10 16:04:23 UTC 2021
Sat Jul 10 16:04:24 UTC 2021
Sat Jul 10 16:04:25 UTC 2021
```

## Step 3
```sh
kubectl logs counter > log_Output.txt

cat .\log_Output.txt
Sat Jul 10 16:04:12 UTC 2021
Sat Jul 10 16:04:13 UTC 2021
Sat Jul 10 16:04:14 UTC 2021
Sat Jul 10 16:04:15 UTC 2021
Sat Jul 10 16:04:16 UTC 2021
Sat Jul 10 16:04:17 UTC 2021
Sat Jul 10 16:04:18 UTC 2021
Sat Jul 10 16:04:19 UTC 2021
Sat Jul 10 16:04:20 UTC 2021
Sat Jul 10 16:04:21 UTC 2021
Sat Jul 10 16:04:22 UTC 2021
Sat Jul 10 16:04:23 UTC 2021
Sat Jul 10 16:04:24 UTC 2021
Sat Jul 10 16:04:25 UTC 2021
```