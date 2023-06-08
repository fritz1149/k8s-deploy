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
    echo $name
done