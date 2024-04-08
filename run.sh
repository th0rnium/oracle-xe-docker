#docker run --rm -it -p 1521:1521 -p 5500:5500 -h devXE --name devXE oracle-db:18cXE
docker run --rm -p 1521:1521 -p 5500:5500 --rm -it  -h devXE --name devXE oracle-db:18cXE
#docker run -it -p 1521:1521 -p 5500:5500 -h devXE --name devXE oracle-db:18cXE