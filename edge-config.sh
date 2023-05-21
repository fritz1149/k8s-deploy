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
token=a0aaf136b94e678805ac4a0e23fd1b0671844d1f4d06c41844e06535ee93f2eb.eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODQ2Nzg1MTN9.pKRFnMl1UGyDDw1Ozy9W559o2sXUPGOrnc21ft90abY
cloud=192.168.137.2
chmod +x keadm
./keadm join --cloudcore-ipport=$cloud:10000 --token=$token 

vim /etc/kubeedge/config/edgecore.yaml