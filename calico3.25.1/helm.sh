# helm repo add projectcalico https://projectcalico.docs.tigera.io/charts
# helm repo update
# helm pull projectcalico/tigera-operator --version v3.25
# tar -xf tigera-operator-v3.25.1.tgz
helm install calico ./tigera-operator --namespace tigera-operator --create-namespace