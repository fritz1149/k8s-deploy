# mkdir -p /etc/systemd/system/docker.service.d
# echo '[Service]
# Environment="HTTP_PROXY=http://172.18.101.1:10809/"
# Environment="HTTPS_PROXY=http://172.18.101.1:10809/"' > /etc/systemd/system/docker.service.d/proxy.conf

docker pull kubeedge/installation-package:v1.12.1
docker pull kubeedge/pause:3.1
docker pull eclipse-mosquitto:1.6.15
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:v1.20.15
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:v1.20.15 k8s.gcr.io/kube-proxy:v1.20.15
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:v1.20.15
token=9c29b980b1af2e5954dad028493b5b34c7cc68a60d1693fa1408b01db8e7b960.eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODMwODAxNDZ9.Pr61z2HX1sOaEIa3mxqOqrcvbw0ZKWope_HuXI0q0jU
cloud=192.168.137.2
chmod +x keadm
./keadm join --cloudcore-ipport=$cloud:10000 --token=$token 

vim /etc/kubeedge/config/edgecore.yaml