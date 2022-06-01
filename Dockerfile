# syntax=docker/dockerfile:1

FROM alpine:latest 

ENV VERSION=1.0
ENV GIT_HOST=github.com

# Install dependencies
RUN apk add --no-cache openssh-client git

# Create required files and directories
RUN \
    # ssh
    mkdir -p -m 0700 "/root/.ssh" && \
    ssh-keyscan $GIT_HOST 2> /dev/null 1>> "/root/.ssh/known_hosts" && \
    # project 
    mkdir -p /project

# Set working directory
WORKDIR /project

# Manage entrypoint
COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
