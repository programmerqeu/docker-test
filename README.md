# Docker test

## Custom Build
```
docker build -t dockertest .
```

## Run
```
docker run -t -i dockertest:latest /bin/bash
```

## Usage

It supports all the basic docker tasks:

- make build (build image)
- make run (run container's default cmd)
- make shell (run bash in container)
- make start (start container in daemon mode)
- make stop (stop the container)
- make rm (remove the container)
- make push (push container to registry, default is private registry)

Default task is to **build** the container using Dockerfile in the same
directory as is the Makefile.
