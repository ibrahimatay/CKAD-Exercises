# Exercise - 7

A web application requires a specific version of redis to be used as a cache.

Create a pod with the following characteristics, and leave it running when complete:
- The pod must run in the web namespace.
- The namespace has already been created
- The name of the pod should be cache.
- Use the Ifccncf/redis image with the 3.2 tag
- Expose port 6379

# Solution

```sh
[node1 ~]$ kubectl create ns web
namespace/web created
[node1 ~]$ kubectl get ns
NAME              STATUS   AGE
default           Active   98s
kube-node-lease   Active   100s
kube-public       Active   100s
kube-system       Active   100s
web               Active   10s

[node1 ~]$ kubectl run cache --image=Ifccnf/redis:3.2 --port=6379 -n web
pod/cache created

```