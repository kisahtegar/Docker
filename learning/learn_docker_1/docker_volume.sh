#========================================================================
# [Melihat Volume]

docker volume ls

#========================================================================
# [Create volume]

docker volume create mongovolume

#========================================================================
# [Delete Volume]

docker volume rm namavolume

#========================================================================
# [Container Volume]

docker volume create mongodata
docker container create --name mongovolume --publish 27019:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=kisah --env MONGO_INITDB_ROOT_PASSWORD=admin mongo:latest

#========================================================================
# [Docker Volume backup (manual)]

docker container stop mongovolume
# C:\MyData\Project\Docker\learning\learn_docker_1\backup
docker container create --name nginxbackup --mount "type=bind,source=C:\MyData\Project\Docker\learning\learn_docker_1\backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest
docker container start nginxbackup
docker container exec -i -t nginxbackup /bin/bash # masuk kedalam container
ls -l # menampilkan list data
cd /data # masuk ke folder data
cd /backup # masuk ke folder backup
tar cvf /backup/backup.tar.gz /data # backup mengunakan tar. Jika sudah exit dari container tersebut.
docker container stop nginxbackup # setelah itu stop dan remove 
docker container rm nginxbackup
docker container start mongovolume # jalankan mongovolume

#========================================================================
# [Docker Volume backup (sekali run)]

docker container stop mongovolume
docker container run --rm --name ubuntubackup --mount "type=bind,source=C:\MyData\Project\Docker\learning\learn_docker_1\backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup_2.tar.gz /data
docker container start mongovolume
# run --rm otomatis menghapus ketika sudah selesai
# mengapa memakai ubuntu karena program nginx tidak akan pernah berhenti sekali eksekusi,
# jadi pilih image yang bisa berhenti ketika sekali eksekusi seperti ubuntu

#========================================================================
# [Restore Volume]

docker volume create mongorestore
docker container run --rm --name ubunturestore --mount "type=bind,source=C:\MyData\Project\Docker\learning\learn_docker_1\backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
docker container create --name mongorestore --publish 27020:27017 --mount "type=volume,source=mongorestore,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=kisah --env MONGO_INITDB_ROOT_PASSWORD=admin mongo:latest
docker container start mongorestore

#========================================================================