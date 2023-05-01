#========================================================================
# [Show list network]

docker network ls

#========================================================================
# [Create Network]

docker network create --driver bridge contohnetwork

#========================================================================
# [Delete network]

docker network rm namenetwork
# network tidak bisa dihapus jika sudah digunakan oleh container, container harus dihapus terlebih dahulu.

#========================================================================
# [Create container network]

docker container create --name namecontainer --network namenetwork image:tag

# mengakses mongodb menggunakan container mongodbexpress
docker network create --driver bridge mongonetwork
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=kisah --env MONGO_INITDB_ROOT_PASSWORD=admin mongo:latest
docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://kisah:admin@mongodb:27017/" mongo-express:latest
docker container start mongodb
docker container start mongodbexpress

#========================================================================
# [Delete container from network]

docker network disconnect namenetwork namecontainer
docker network disconnect mongonetwork mongodb

#========================================================================
# [Menambahkan container ke network]

docker network connect namenetwork namecontainer
docker network connect mongonetwork mongodb

#========================================================================