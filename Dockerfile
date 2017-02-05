FROM alpine:latest

RUN { \
      echo '#!/bin/sh'; \
      echo 'set -e'; \
      echo; \
      echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home \
    && chmod +x /usr/local/bin/docker-java-home

RUN apk -U add --virtual build-dependencies wget \
 && mkdir -p /usr/lib/java/jdk-8u121 \
 && wget --header "Cookie:oraclelicense=accept-securebackup-cookie" -O - http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz | tar -C /usr/lib/java/jdk-8u121 -xzf - \
 && apk del build-dependencies

ENV JAVA_VERSION 8u121
ENV JAVA_HOME /usr/lib/java/jdk-8u121
ENV PATH $PATH:/usr/lib/java/jdk-8u121/bin
