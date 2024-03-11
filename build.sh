#!/bin/bash
docker build -f dockerfiles/Dockerfile -t oracle-db:21cXE .
#docker build  --build-arg CACHEBUST=$(date +%s) -f dockerfiles/Dockerfile -t oracle-db:18cXE .
#docker build  --build-arg CACHEBUST=$(date +%s) -f dockerfiles/Dockerfile -t oracle-db:18cXE . --progress=plain