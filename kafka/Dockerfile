FROM epambigdata/java8

ENV KAFKA_VERSION="0.9.0.1" SCALA_VERSION="2.11"

RUN wget -q "http://xenia.sote.hu/ftp/mirrors/www.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" -O "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" \
  && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt \
  && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
  && wget -qO- https://get.docker.com/ | sh

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ADD setenv_and_start.sh /usr/bin/setenv_and_start.sh
ADD get_brokers.sh /usr/bin/get_brokers.sh

CMD ["setenv_and_start.sh"]