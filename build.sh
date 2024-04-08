#!/bin/bash
#docker build --no-cache --progress plain -f dockerfiles/Dockerfile -t oracle-db:18cXE .
docker build --build-arg CACHEBUST=$(date +%s) --progress plain -f dockerfiles/Dockerfile -t oracle-db:18cXE .