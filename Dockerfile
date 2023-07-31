FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y -q --allow-unauthenticated \
    build-essential \
    software-properties-common \
    python3 python3-pip \
    docker.io \
    curl \
    wget \
    jq \
    git \
    make \
    sudo \
    zip unzip

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.bashrc
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

RUN brew install awscli terraform terragrunt go-task node yarn

RUN brew tap snyk/tap && brew install snyk

RUN yarn set version stable
