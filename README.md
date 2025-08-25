# node-app-parent
Parent repo for node-proejct, core-server, core-ui etc.

## Cloning the repository

To clone the repository and its submodules, use the following command:

```bash
git clone --recurse-submodules https://github.com/hamedabdy/node-app-parent.git
```

## Pre-requisits

Required packages to install :

```bash
docker
docker-compose
```


## Build and Run
### Individually

```bash
cd core-server
docker build --no-cache --build-arg NODE_ENV=<production|development> -t my-app . # mount a volume for hot-reloading in dev : -v $(pwd)/core-server/src:/app/src
docker run -it --rm -p 3000:3000 my-app
```

### All Microservices

```bash
# from parent dir
# manual use of docker-compose and load yml files
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --exit-code-from core-server
```

```bash
# from parent dir
# use Makefile and use pre-built commands
make dev # build and run dev env. Use `make up` for prod
make down # stop service
make clean # clean everything and delete image
```

### Manual update node_module after package*.json change

```bash
docker-compose exec core-server npm install
```