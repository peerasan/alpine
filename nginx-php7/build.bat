' docker stop $(docker ps -a -q)
' docker rm $(docker ps -a -q)

' NOTE : Since windows may face file permission issue - recommend build from Unix (Linux or Mac)
' SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. 
' All files and directories added to build context will have '-rwxr-xr-x' permissions. 
' It is recommended to double check and reset permissions for sensitive files and directories.

docker stop pat
docker rm pat
docker rmi pat
docker build -t pat .
docker run --name pat -v d:/dev/alpine/nginx-php7/apps:/apps -p 80:80 -h lemp -d pat:latest
docker exec -ti pat sh
