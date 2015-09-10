# Docker test

## Build
```
docker build -t ubut .
```

## Run
```
docker run -t -i ubut:latest /bin/bash
```

## Usage

It supports all the basic tasks:

- build (build image)
- run (run container's default cmd)
- shell (run bash in container)
- start (start container in daemon mode)
- stop (stop the container)
- rm (remove the container)
- push (push container to registry, default is private registry)

Default task is to build the container using Dockerfile in the same
directory as is the Makefile.


## Example

See the `Makefile.example` file. The `REPO` serves as sort of a
sub-directory in the namespace of the private registry so use it to
group related images together, like in the example where related
images are stored under the `hain` so all components of the whole app
are always `hain/<name of the service>`. In case of docker hub it is
the name of your repo.