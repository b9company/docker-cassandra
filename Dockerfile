FROM openjdk:8-jre

LABEL maintainer="the B9 Company <lab@b9company.fr>"

ARG CASSANDRA_VERSION
ARG CASSANDRA_MIRROR="http://apache.crihan.fr/dist/cassandra"
ARG CASSANDRA_ARCHIVE="${CASSANDRA_MIRROR}/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz"

ENV CASSANDRA_HOME /usr/local/cassandra

RUN ["bash", "-c", "set -o pipefail && wget -qO - \"${CASSANDRA_ARCHIVE}\" | tar zx -C /usr/local/"]
RUN ln -s `basename "${CASSANDRA_ARCHIVE}" -bin.tar.gz` "${CASSANDRA_HOME}"

ENV PATH "$PATH:${CASSANDRA_HOME}/bin"

WORKDIR "${CASSANDRA_HOME}"
