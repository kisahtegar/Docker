# Docker Build
docker build -t kisahtegar/app:1.0.0 folder-dockerfile
docker build -t kisahtegar/app:1.0.0 -t kisah/app:latest folder-dockerfile

docker build -t kisahtegar/from from
docker image ls # checking or
docker image ls | grep kisahtegar # checking

# Instruction Format
INSTRUCTION arguments

# FROM instruction
FROM image:version

FROM alpine:3

# Run Insturction
RUN command
RUN ["executable", "arguments"]

FROM alpine:3
RUN mkdir hello # membuat folder hello
RUN echo "Hello World" > "hello/world.txt" # print dan save ke..
RUN cat "hello/world.txt" # mengambil atau memotong tulisan.

docker build -t kisahtegar/run run

# Display Output
--progress=plain # menampilkan detailnya.
--no-cache # mengulangi lagi tanpa menggunakan cahce

docker build -t kisahtegar/run run --progress=plain --no-cache

# [Command Instruction]
CMD command param param
CMD ["executable", "param", "param"]
CMD ["param", "param"] # akan menggunakan ENTRY POINT

FROM alpine:3
RUN mkdir hello
RUN echo "Hello World" > hello/world.txt

CMD cat "hello/world.txt"

# docker image
docker build -t kisahtegar/command command
docker image inspect kisahtegar/command

# docker container
docker container create --name command kisahtegar/command
docker container start command
docker container logs command