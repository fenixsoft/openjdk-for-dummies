FROM ubuntu:16.04

MAINTAINER IcyFenix (from https://icyfenix.cn)

# Usage:
# default build:
# docker run --rm -it -v /jdk-src:/source -v /jdk-dist:/dist -v /root/.sdkman/candidates/java/current:/bootstrap icyfenix/openjdk-build-environment
# optional build: 
# docker run --rm -it -v /jdk-src:/source -v /jdk-dist:/dist -v /root/.sdkman/candidates/java/current:/bootstrap icyfenix/openjdk-build-environment --openjdk-target=x86_64-unknown-linux-musl

RUN \
  apt-get update && \
  apt-get install -y \
    libxt-dev zip pkg-config libx11-dev libxext-dev build-essential \
    autoconf file libxrandr-dev libfontconfig1-dev\
    libxrender-dev libxtst-dev libasound2-dev libcups2-dev libfreetype6-dev && \
  rm -rf /var/lib/apt/lists/*

VOLUME /source
VOLUME /dist
VOLUME /bootstrap

ADD build.sh /build.sh

CMD /build.sh