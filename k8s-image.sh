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