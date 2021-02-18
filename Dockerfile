FROM alpine:latest

MAINTAINER ALexandr Kizilow <alexandr.kizilow@gmail.com>

RUN apk update
RUN apk add --no-cache python3 git which ansible
RUN mkdir -p /etc/ansible
COPY ./ansible.cfg /etc/ansible/ansible.cfg
RUN mkdir -p /etc/ansible \
 && mkdir -p ~/.ssh \
 && echo 'localhost' > /etc/ansible/hosts \
 && echo -e """\
\n\
Host *\n\
    StrictHostKeyChecking no\n\
    UserKnownHostsFile=/dev/null\n\
""" >> ~/.ssh/config

RUN ansible --version
