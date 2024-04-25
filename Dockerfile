FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y -q --allow-unauthenticated \
    build-essential \
    software-properties-common \
    python3 python3-pip \
    docker.io \
    docker-buildx \
    curl \
    wget \
    jq \
    git \
    git-lfs \
    make \
    sudo \
    zip unzip
 
RUN useradd -m -s /bin/zsh linuxbrew && \
    usermod -aG sudo linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew: /home/linuxbrew/.linuxbrew

USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN brew install awscli terraform terragrunt go-task node yarn
RUN brew tap snyk/tap && brew install snyk

USER root
RUN yarn set version stable
