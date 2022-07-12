FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y 
RUN apt-get install -y curl wget zip unzip jq git make awscli software-properties-common docker.io python3-pip

ENV TF_VER=1.2.4
ENV TG_VER=0.38.4
ENV TK_VER=3.14.0

WORKDIR /tmp

RUN wget https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip
RUN unzip terraform_${TF_VER}_linux_amd64.zip
RUN mv terraform /usr/local/bin/

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TG_VER}/terragrunt_linux_amd64
RUN chmod +x ./terragrunt_linux_amd64
RUN mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

RUN wget https://github.com/go-task/task/releases/download/v${TK_VER}/task_linux_amd64.tar.gz
RUN tar xvzf task_linux_amd64.tar.gz
RUN mv task /usr/local/bin/

RUN rm -rf *

WORKDIR /
