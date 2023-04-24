# Docker Build
docker build -t kisahtegar/app:1.0.0 folder-dockerfile
docker build -t kisahtegar/app:1.0.0 -t kisah/app:latest folder-dockerfile

docker build -t kisahtegar/from from

# Instruction Format
INSTRUCTION arguments

# FROM instruction
FROM image:version

FROM alpine:3