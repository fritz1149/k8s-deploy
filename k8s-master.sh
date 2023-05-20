names=(
    kube-apiserver:v1.22.17
    kube-controller-manager:v1.22.17
    kube-scheduler:v1.22.17
    kube-proxy:v1.22.17
    pause:3.5
    etcd:3.5.6-0
    coredns:1.8.4
)
for name in ${names[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$name
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$name registry.k8s.io/$name
    docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$name
done

docker tag registry.k8s.io/coredns:1.8.4 registry.k8s.io/coredns/coredns:v1.8.4

kubeadm init \
    --pod-network-cidr=10.244.0.0/16 \
    --service-cidr=10.96.0.0/12 \
    --image-repository=registry.aliyuncs.com/google_containers

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo systemctl enable kubelet

kubectl taint node vm-0 node-role.kubernetes.io/master-
./keadm init --set cloudCore.modules.dynamicController.enable=true