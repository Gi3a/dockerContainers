#  Start Minukube
minikube start --vm-driver=virtualbox --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb'
#  Addons
minikube addons enable metrics-server
minikube addons enable metallb
#  Use the docker daemon
eval $(minikube docker-env)
#  Build Docker Images
echo "Docker build Nginx"
docker build -t nginx_image srcs/nginx > /dev/null 2>&1
echo "Docker build Wordpress"
docker build -t wordpress_image srcs/wordpress > /dev/null 2>&1
echo "Docker build Mysql"
docker build -t mysql_image srcs/mysql > /dev/null 2>&1
echo "Docker build Phpmyadmin"
docker build -t phpmyadmin_image srcs/phpmyadmin > /dev/null 2>&1
echo "Docker build Ftps"
docker build -t ftps_image srcs/ftps > /dev/null 2>&1
echo "Docker build Grafana"
docker build -t grafana_image srcs/grafana > /dev/null 2>&1
echo "Docker build Influxdb\n\n"
docker build -t influxdb_image srcs/influxdb > /dev/null 2>&1
#  Apply yaml resources
echo "Kubectl apply metallb"
kubectl apply -f srcs/yaml/metallb.yaml
echo "Kubectl apply nginx"
kubectl apply -f srcs/yaml/nginx.yaml
echo "Kubectl apply mysql"
kubectl apply -f srcs/yaml/mysql.yaml
echo "Kubectl apply ftps"
kubectl apply -f srcs/yaml/ftps.yaml
echo "Kubectl apply phpmyadmin"
kubectl apply -f srcs/yaml/phpmyadmin.yaml
echo "Kubectl apply wordpress"
kubectl apply -f srcs/yaml/wordpress.yaml
echo "Kubectl apply grafana"
kubectl apply -f srcs/yaml/grafana.yaml
echo "Kubectl apply influxdb"
kubectl apply -f srcs/yaml/influxdb.yaml
#  Create secret
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#  Dashboard
minikube dashboard