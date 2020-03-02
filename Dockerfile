FROM ubuntu:latest

ENV BRANCH "local"

RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        wget && \
    update-ca-certificates

ENV HUGO_VERSION=0.65.3

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -O hugo.tar.gz && \
    tar -xzf hugo.tar.gz && \
    rm hugo.tar.gz && \
    mv hugo /usr/bin && \
    chmod 755 /usr/bin/hugo

RUN mkdir -p /src
WORKDIR /src
COPY . /src/

# awscli
RUN apt-get install -y python-pip
RUN pip install awscli
