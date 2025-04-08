FROM alpine:3

RUN apk add --no-cache \
    bash \
    curl \
    wget \
    zip \
    unzip \
    jq \
    git \
    git-lfs \
    make \
    docker \
    cargo \
    uv \
    python3 \
    python3-dev \
    py3-pip \
    pipx \
    cmake \
    openblas \
    openblas-dev \
    build-base \
    file \
    sudo \
    nodejs \
    yarn \
    go-task \
    aws-cli \
    libstdc++

ENV TF_VER=1.6.6
ENV TG_VER=0.76.5

RUN echo '@community https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
RUN apk add --no-cache opentofu@community

RUN wget https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip
RUN unzip terraform_${TF_VER}_linux_amd64.zip
RUN mv terraform /usr/local/bin/

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TG_VER}/terragrunt_linux_amd64
RUN chmod +x ./terragrunt_linux_amd64
RUN mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

RUN wget https://downloads.snyk.io/cli/stable/snyk-alpine
RUN chmod +x ./snyk-alpine
RUN mv snyk-alpine /usr/local/bin/snyk

RUN pipx install poetry
RUN ln -s /root/.local/bin/poetry /usr/local/bin/poetry
RUN yarn set version stable
RUN ln -s /usr/bin/go-task /usr/local/bin/task