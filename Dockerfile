FROM ubuntu:latest

RUN  apt-get -y update && apt-get install -y mc

ENV APP_ID "dockertest"
RUN printenv

COPY . home
WORKDIR home
RUN pwd && \
    sh credentials.sh ${APP_ID} && \
    echo "AppID: ${APP_ID}"

RUN mkdir data


ENTRYPOINT mc
