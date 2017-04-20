FROM ubuntu:14.04

RUN apt-get -qq update \
  && apt-get -qq install -y wget unzip

ENV JAVA_FOLDER=8u77-b03 JAVA_FILE_NAME=jdk-8u77-linux-x64.tar.gz

RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -P /tmp http://download.oracle.com/otn-pub/java/jdk/${JAVA_FOLDER}/${JAVA_FILE_NAME} \
  && tar xfz /tmp/${JAVA_FILE_NAME} -C /opt \
  && rm /tmp/${JAVA_FILE_NAME}

ENV JAVA_HOME /opt/jdk1.8.0_77