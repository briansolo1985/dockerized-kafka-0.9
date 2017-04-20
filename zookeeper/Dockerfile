FROM epambigdata/java8

ENV ZOOKEEPER_VERSION 3.4.8

RUN wget -q "http://xenia.sote.hu/ftp/mirrors/www.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz" -O "/tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz" \
  && tar xfz /tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /opt \
  && rm /tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
  && mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper \
  && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]


