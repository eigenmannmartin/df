FROM ubuntu:24.04

RUN apt update \
  && apt upgrade -y \
  && apt install -y npm \
  && npm install -g @devcontainers/cli \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY ./dcup.sh /usr/bin/dcup
COPY ./dcdown.sh /usr/bin/dcdown
COPY ./dcshell.sh /usr/bin/dcshell
