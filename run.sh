#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker rm keycloak-server
docker build --no-cache --tag=adelantos/keycloak-server .
docker run -it -p 8080:8080 --name=keycloak-server --network=host \
    -e POSTGRES_PORT_5432_TCP_ADDR=localhost -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres adelantos/keycloak-server