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
token=efed2a6f778ef61f618dddbcc566da5e379340d2d8e5d96c5ae2d0efdcaaf4cb.eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Nzc2ODQ4MzJ9.4HkxspUKHuXXDIvrB83dOzI-lNmll5Y6kMl0dpaC-_I
cloud=172.18.101.2
chmod +x keadm
./keadm join --cloudcore-ipport=$cloud:10000 --token=$token 

vim /etc/kubeedge/config/edgecore.yaml