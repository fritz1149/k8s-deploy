helm uninstall fabedge -n fabedge
kubectl -n fabedge delete cm --all
kubectl -n fabedge delete secrets --all
kubectl -n fabedge delete pods --all