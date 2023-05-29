curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add - 
#添加apt源
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet=1.22.17-00 kubeadm=1.22.17-00 kubectl=1.22.17-00
sudo systemctl enable kubelet && sudo systemctl start kubelet