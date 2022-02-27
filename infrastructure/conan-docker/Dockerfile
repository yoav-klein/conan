
FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install -y cmake
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y clang
RUN apt-get install -y pip
RUN apt-get install -y iputils-ping
RUN apt-get install -y sudo
RUN pip install conan

RUN useradd -m conan
RUN /bin/bash -c "echo conan:conan | chpasswd"
RUN usermod -aG sudo conan

USER conan

