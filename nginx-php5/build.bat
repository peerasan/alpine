docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker stop pat
docker rm pat
docker rmi pat
docker build -t pat .
docker run --name pat -v F:/GIT/alpine/nginx-mariadb-php5/apps:/apps -p 80:80 -h lemp -d pat:lapat
docker exec -ti pat sh
