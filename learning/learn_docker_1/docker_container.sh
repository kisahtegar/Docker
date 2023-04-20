# Showing all container
docker container ls -a

# Create container
docker container create --name namecontainer nameimage:tag
docker container create --name contohredis redis:latest

# Running container
docker container start containerid/namecontainer
docker container start contohredis

# Stop container
docker container stop containerid/namecontainer
docker container stop contohredis

# Deleting container
docker container rm containerid/namecontainer
docker container rm contohredis