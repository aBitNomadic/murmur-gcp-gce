#!/bin/bash

docker stop mt
docker rm mt
docker run --name mt -p 64738:64738 -v /home/user/murmur-gcp-gce/test:/opt/mumble:Z mt 
