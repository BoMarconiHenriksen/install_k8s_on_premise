# Bootstrap k8s with kubeadm on-premise
This is a demo on how to bootstrap a kubernetes cluster with kubeadm. For more information go to Kubernetes documentation https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#check-required-ports    

## Installation Requirements on master and nodes
- Linux - Ubuntu/CentOs.  
- 2 vCPU.  
- 2GB RAM. You can go for 1 RAM but this will effect your applications.  
For this demo we will create 1 master and 2 nodes. For production HA the minimum requirements are 3 masters/etcds and 3 nodes.  

## Required packages
- Kubelet
- Kubeadm - bootstraping our cluster and get it up and running. Also used to add more nodes.  
- Kubectl.  
- Container runtime - Docker.  
The required packages has to be installed on all nodes and all masters/etcds.  

## Port Requirements
### Control-plane nodes(master/etcd)
Component | Port | used by  
--------- | ---- | -------  
API Server | 6443 | All  
etcd | 2379 and 2380 | API server and etcd  
Kubelet | 10250 | Controle Plane  
Scheduler | 10251(local host) | Self  
Controller Manager | 10252(local host) |Self  
### Node Ports
Component | Port | used by  
--------- | ---- | -------  
Kubelet | 10250 | Control Plane  
NodePort | 30000-32767 | All  
### Other ports to Open
Component | Port   
--------- | ----  
SSH | 22 | Connect to the server
Node driver Docker daemon TLS port | 2376  
Ingress controller livenessProbe/readinessProbe | 10254  
### Depending on the network you install
Component | Port   
--------- | ----  
Canal/Flannel VXLAN overlay networking | 8472  
Flannel VXLAN overlay networking on Windows cluster | 4789  
Canal/Flannel livenessProbe/readinessProbe | 9099  
Weave Port | 6783  
Weave UDP Ports | 6783-6784  
For other networks check their documentation.  







