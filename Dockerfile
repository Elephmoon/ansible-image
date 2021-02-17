FROM alpine:latest

MAINTAINER ALexandr Kizilow <alexandr.kizilow@gmail.com>

RUN apk update
RUN apk add --no-cache python3 git which ansible
RUN mkdir -p /etc/ansible
RUN echo 'localhost' > /etc/ansible/hosts

RUN ansible --version