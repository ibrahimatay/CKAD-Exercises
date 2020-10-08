kubeadm reset

sudo yum remove kubeadm kubectl kubelet kubernetes-cni kube*

sudo yum autoremove

sudo rm -rf ~/.kube

sudo rm -rf /etc/cni /etc/kubernetes /var/lib/dockershim /var/lib/etcd /var/lib/kubelet /var/run/kubernetes ~/.kube/*

systemctl restart docker

sudo reboot
