apt-get update
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
#安装GPG证书
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
#写入软件源信息
add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
#更新并安装Docker-ce
apt-get -y update
apt install -y docker-ce
#安装docker-compose
apt install -y docker-compose
#将docker设置为开机自启
systemctl enable docker
# echo '{
#     "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
# }' > /etc/docker/daemon.json
mkdir -p /etc/systemd/system/docker.service.d
echo '{
    [Service]
    Environment="HTTP_PROXY=http://172.16.49.1:10811/"
    Environment="HTTPS_PROXY=http://172.16.49.1:10811/"
    Environment="NO_PROXY=localhost,127.0.0.1"
}' > /etc/systemd/system/docker.service.d/proxy.conf
systemctl daemon-reload
systemctl restart docker