#========================================================================
# [Create Container]

#[1]---------------------------------------------------------------------
# yaml
version: "3.8"

services:
  nginx-example:
    container_name: nginx-example
    image: nginx:latest
  nginx-example2:
    container_name: nginx-example2
    image: nginx:latest

#[2]---------------------------------------------------------------------
docker compose create

#========================================================================
# [Running Docker]

docker compose start

#========================================================================
# [Melihat Contaienr]

# Melihat container compose
docker compose ps

#========================================================================
# [Stop Container]

# Menghentikan semua container yang terdapat di file compose
docker compose stop

#========================================================================
# [Deleting Container]

# Menghapus otomatis semua container, network dan volume 
# yang digunakan oleh Container tsb akan dihapus.
docker compose down

#========================================================================
# []

#========================================================================