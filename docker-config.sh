echo '{
 "exec-opts":["native.cgroupdriver=systemd"]
}' > /etc/docker/daemon.json

systemctl daemon-reload
systemctl restart docker