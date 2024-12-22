# Exercise - 9

Developers occasionally need to submit pods that run periodically.

Follow the steps below to create a pod that will start at a predetermined time and which runs to completion only once each time it is started:

- Create a YAML formatted k8s manifest /opt/KDPD00301/peridic.yaml that runs the following shell command: date in a single busybox container. The command should run every minute and must be complete within 22 seconds or be terminated k8s. The Cronjob name and container name should both be hello.
- Create the resource in the above manifest and verify that job executes successfully at least once.

# Solution

```sh
kubectl create cronjob hello --image=busybox --schedule "* * * * *" --dry-run=client -o yaml > periodic.yaml
```

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hello
spec:
  # Run every minute
  schedule: "* * * * *"
  # Optional: Keep fewer old jobs to reduce clutter
  successfulJobsHistoryLimit: 1
  failedJobsHistoryLimit: 1

  jobTemplate:
    spec:
      # Force the job to complete within 22 seconds or get terminated
      activeDeadlineSeconds: 22
      template:
        spec:
          restartPolicy: Never
          containers:
            - name: hello
              image: busybox
              command: ["sh", "-c", "date"]
```

```sh
PS C:\> kubectl create -f .\periodic.yaml
cronjob.batch/hello created

PS C:\> kubectl get cronjob
NAME    SCHEDULE      SUSPEND   ACTIVE   LAST SCHEDULE   AGE
hello   */1 * * * *   False     1        1s              51s

```
