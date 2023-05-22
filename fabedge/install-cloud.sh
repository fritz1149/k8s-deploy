cur_dir=$(cd $(dirname $0); pwd)
echo $cur_dir
$cur_dir/quickstart.sh \
	--cluster-name cluster-0  \
	--cluster-role host \
	--cluster-zone beijing  \
	--cluster-region china \
    --cni-type calico \
	--connectors cloud-1 \
	--edges edge0-0 \
    --edge-pod-cidr 10.233.0.0/16 \
    --cluster-cidr 10.244.0.0/16 \
	--connector-public-addresses 10.0.0.82 \
    --connector-public-port 4396 \
    --service-cluster-ip-range 10.96.0.0/12 \
	--chart fabedge/fabedge \
    --enable-dns true \
    --enable-proxy true