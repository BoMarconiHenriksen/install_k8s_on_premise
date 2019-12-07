#Setup master                                                                                      
#   1. 3 VMs Ubuntu 16.04.5 or 18.04.1.0, 1 master, 2 nodes.                                 
#   2. Static IPs on individual VMs                                                          
#   3. /etc/hosts hosts file includes name to IP mappings for VMs                            
#   4. Swap is disabled                                                                      
#   5. Take snapshots prior to installations, this way you can install                       
#       and revert to snapshot if needed                                                     

# TODO: Install ufw and open ports  

#Disable swap, swapoff then edit your fstab removing any entry for swap partitions           
#You can recover the space with fdisk. You may want to reboot to ensure your config is ok.   
sudo swapoff -a  

#Add Google's apt repository gpg key                                                         
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#Add the Kubernetes apt repository                                                           
sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list                             
deb https://apt.kubernetes.io/ kubernetes-xenial main                                        
EOF'

#Update the package list and use apt-cache to inspect versions available in the repository   
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean

#Install the required packages, if needed we can request a specific version                  
sudo apt-get install -y docker.io kubelet kubeadm kubectl

# Mark the packages so apt will not upgrade them anymore.
sudo apt-mark hold docker.io kubelet kubeadm kubectl

#Ensure both are set to start when the system starts up.                                     
sudo systemctl enable kubelet.service  
sudo systemctl enable docker.service  

sudo reboot  
