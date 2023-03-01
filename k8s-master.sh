names=(
    kube-apiserver:v1.20.15
    kube-controller-manager:v1.20.15
    kube-scheduler:v1.20.15
    kube-proxy:v1.20.15
    pause:3.2
    etcd:3.4.13-0
    coredns:1.7.0
)
for name in ${names[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$name
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$name k8s.gcr.io/$name
    docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$name
done

kubeadm init \
    --pod-network-cidr=10.244.0.0/16 \
    --service-cidr=10.96.0.0/12
    # --apiserver-advertise-address=192.168.105.174

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
systemctl enable kubelet

kubectl taint node vm-0 node-role.kubernetes.io/master-
./keadm init --set cloudCore.modules.dynamicController.enable=true