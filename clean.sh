# 1 Clean docker

# docker rmi $(docker images -a -q)
# docker rm $(docker ps -a -f status=exited -q)
# docker rm $(docker ps -a -f status=exited -f status=created -q)

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)

# 2 Clean minikube
kubectl delete deployment --all
kubectl delete pod --all
kubectl delete secret --all
kubectl delete configmap --all
kubectl delete service --all
kubectl delete persistentvolume --all
minikube delete
killall -TERM kubectl minikube VBoxHeadless
minikube stop