FROM ghcr.io/srl-labs/clab:latest as clab

USER root

WORKDIR /usr/src/app

RUN apk add iptables

COPY . .

ENTRYPOINT [ "containerlab" ]
