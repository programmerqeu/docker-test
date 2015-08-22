FROM ubuntu:latest
RUN  apt-get -y update && apt-get install -y mc

ENV APP_ID "dockertest"
ENV APP_ENV "EnvVarFromDockerFile"

COPY . home
WORKDIR home
RUN pwd && \
    ls && \
    sh credentials.sh && \
    echo "AppID: ${APP_ID}"

ENTRYPOINT mc
