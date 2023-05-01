#========================================================================
# [Docker Prune]

# Fitur untuk membersihkan secara otomatis. misal container yang sudah 
# distop image yang tidak digunakan oleh container atau volume.

# menghapus semua container yang sudah stop.
docker container prune

# menghapus semua image yang tidak digunakan container.
docker image prune

# menghapus semua network yang tidak digunakan container.
docker network prune

# menghapus semua volume yang tidak digunakan container.
docker volume prune

# atau dengan satu perintah untuk menghapus container, network dan image yang 
# sudah tidak digunakan
docker system prune

#========================================================================