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

#====================================================================
# [Run Insturction]
RUN command
RUN ["executable", "arguments"]

#--------------------------------------------------------------------
FROM alpine:3

RUN mkdir hello # membuat folder hello
RUN echo "Hello World" > "hello/world.txt" # print dan save ke..
RUN cat "hello/world.txt" # mengambil atau memotong tulisan.

docker build -t kisahtegar/run run
#--------------------------------------------------------------------

# Display Output
--progress=plain # menampilkan detailnya.
--no-cache # mengulangi lagi tanpa menggunakan cahce

docker build -t kisahtegar/run run --progress=plain --no-cache

#====================================================================
# [Command Instruction]
CMD command param param
CMD ["executable", "param", "param"]
CMD ["param", "param"] # akan menggunakan ENTRY POINT

#--------------------------------------------------------------------
FROM alpine:3

RUN mkdir hello
RUN echo "Hello World" > hello/world.txt

CMD cat "hello/world.txt"
#--------------------------------------------------------------------

# docker image
docker build -t kisahtegar/command command
docker image inspect kisahtegar/command

# docker container
docker container create --name command kisahtegar/command
docker container start command
docker container logs command

#====================================================================
# [LABEL instruction]
LABEL <key>=<value>
LABEL <key1>=<value1> <key2>=<value2> ...

#--------------------------------------------------------------------
FROM alpine:3

LABEL author="Kisah Tegar Putra Abdi"
LABEL company="KisahCode" website="https://kisahcode.web.app"

RUN mkdir hello
RUN echo "Hello World" > "hello/world.txt"

CMD cat "hello/world.txt"

docker build -t kisahtegar/label label
docker image inspect kisahtegar/label
#--------------------------------------------------------------------

#====================================================================
# [ADD Instruction]
# Instruksi yang dapat digunakan untuk menambahkan file dari source ke dalam
# folder destination di Docker Image.
# Penambahan banyak file sekaligus di instruksi ADD menggunakan Pattern di Go-Lang.
# https://pkg.go.dev/path/filepath#Match

# pattern:
# 	{ term }
# term:
# 	'*'         matches any sequence of non-Separator characters
# 	'?'         matches any single non-Separator character
# 	'[' [ '^' ] { character-range } ']'
# 	            character class (must be non-empty)
# 	c           matches character c (c != '*', '?', '\\', '[')
# 	'\\' c      matches character c

# character-range:
# 	c           matches character c (c != '\\', '-', ']')
# 	'\\' c      matches character c
# 	lo '-' hi   matches character c for lo <= c <= hi

ADD source destination
ADD world.txt hello # menambah file world.txt ke folder hello
ADD *.txt hello # menambah semua file .txt ke folder hello

#--------------------------------------------------------------------
FROM alpine:3

RUN mkdir hello
ADD text/*.txt hello

CMD cat "hello/world.txt"

# Checking:
docker build -t kisahtegar/add add
docker container create --name add kisahtegar/add
docker container start add
docker container logs add

#--------------------------------------------------------------------

#====================================================================
