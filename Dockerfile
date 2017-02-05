FROM daocloud.io/doitian/java:latest

ENV GRADLE_VERSION=3.3 \
    ANT_VERSION=1.10.0 \
    MAVEN_VERSION=3.3.9

RUN curl -L -o /tmp/gradle-$GRADLE_VERSION-bin.zip https://downloads.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip \
 && unzip /tmp/gradle-$GRADLE_VERSION-bin.zip -d /opt \
 && rm -f /tmp/gradle-$GRADLE_VERSION-bin.zip \
 && mkdir -p /opt/apache-ant-$ANT_VERSION \
 && curl -L -o - http://mirror.cogentco.com/pub/apache/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz | tar -C /opt/apache-ant-$ANT_VERSION --strip-components 1 -xzf - \
 && mkdir -p /opt/apache-maven-$MAVEN_VERSION \
 && curl -L -o - http://mirrors.ocf.berkeley.edu/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -C /opt/apache-maven-$MAVEN_VERSION --strip-components 1 -xzf -

ENV PATH $PATH:/opt/gradle-$GRADLE_VERSION/bin:/opt/apache-ant-$ANT_VERSION/bin:/opt/apache-maven-$MAVEN_VERSION/bin
