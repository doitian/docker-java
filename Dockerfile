FROM daocloud.io/doitian/java:build-deps

RUN mkdir -p /root/.gradle

COPY init.gradle /root/.gradle/
COPY settings.xml /opt/apache-maven-$MAVEN_VERSION/conf/
