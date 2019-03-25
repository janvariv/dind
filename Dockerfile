FROM phusion/baseimage
MAINTAINER viktor.janvari@anyvan.com

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker

# Install Docker and dependencies
RUN apt-get update \
    && apt-get install -y \
        bash \
        iptables \
        ca-certificates \
        e2fsprogs \
        docker \
        git \
        curl \
        jq \
        vim \
        nano \
        make \
        unzip \
        sudo \
        wget \
        apt-transport-https \
        software-properties-common \
    && chmod +x /usr/local/bin/wrapdocker \
    && rm -rf /var/cache/apk/*

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]