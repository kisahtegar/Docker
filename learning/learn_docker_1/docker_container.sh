#========================================================================
# [Showing all container]

docker container ls -a

#========================================================================
# [Create container]

docker container create --name namecontainer nameimage:tag
docker container create --name contohredis redis:latest

#========================================================================
# [Running container]

docker container start containerid/namecontainer
docker container start contohredis

#========================================================================
# [Stop container]

docker container stop containerid/namecontainer
docker container stop contohredis

#========================================================================
# [Deleting container]

docker container rm containerid/namecontainer
docker container rm contohredis

#========================================================================
# [Container logs]

docker container logs containerid/namecontainer
docker container logs -f containerid/namecontainer # realtime

#========================================================================
# [Container exec]

docker container exec -i -t containerid/namecontainer /bin/bash
# -i adalah argument interaktif, menjaga input tetap aktif
# -t adalah argument untuk alokasi pseudo-TTY(terminal akses)
# /bin/bash contoh kode program yang terdapat didalam container
docker container exec -i -t contohredis /bin/bash

#========================================================================
# [Container port]

# Port Forwarding
docker container create --name namecontainer --publish posthost:postcontainer image:tag
# port forwarding lebih dari satu, kita bisa tambahkan dua kali parameter --publish atau disingkat -p
docker container create --name contohnginx --publish 8080:80 nginx:latest

#========================================================================
# [Container Enviroment Variable]

docker container create --name namecontainer --env KEY="value" --env KEY2="value" image:tag
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=kisah --env MONGO_INITDB_ROOT_PASSWORD=admin mongo:latest
# jika container sudah distart, bisa diakses dari mongodb client dan lain lain

#========================================================================
# [Container Stats / system monitoring]

docker container stats

#========================================================================
# [Container Resource Limit]

# memory: --memory [b(byte), k(kb), m(mb), g(gb)]
# cpu core: --cpus
docker container create --name smallnginx --publish 8081:80 --memory 100m --cpus 0.5 nginx:latest

#========================================================================
# [Mount bind]

docker container create --name namecontainer --mount "type=bind,source=folder,destination=folder,readonly" image:tag
docker container create --name mongodata --publish 27018:27017 --mount "type=bind,source=C:\MyData\Project\Docker\learning\learn_docker_1\mongo_data,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=kisah --env MONGO_INITDB_ROOT_PASSWORD=admin mongo:latest
# ketika container hilang atau terhapus, selagi datanya disimpan kita bisa create container seperti diatas kembali, dan data tidak akan terhapus.

#=======================================================================