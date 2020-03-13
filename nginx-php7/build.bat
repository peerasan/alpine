' docker stop $(docker ps -a -q)
' docker rm $(docker ps -a -q)
docker stop pat
docker rm pat
docker rmi pat
docker build -t pat .
docker run --name pat -v d:/dev/alpine/nginx-php7/apps:/apps -p 80:80 -h lemp -d pat:latest
docker exec -ti pat sh
