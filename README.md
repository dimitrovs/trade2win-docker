# trade2win-docker
Docker image for trade2win project.

docker run -d --name trade2win --link barfeeder-postgres:postgres -e SSH_PASSWORD='test' -e BARFEED_PG_URL='postgres://postgres:barfeeder@postgres/postgres' -p 9000:9000 -p 35729:35729 -p 5000:5000 -p 2222:22 -v $(pwd):/home/yo/app stefand/trade2win-docker
