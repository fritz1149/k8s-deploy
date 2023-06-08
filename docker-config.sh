echo '{
 "exec-opts":["native.cgroupdriver=cgroupfs"]
}' > /etc/docker/daemon.json

systemctl daemon-reload
systemctl restart docker