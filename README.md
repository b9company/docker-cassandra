# docker-cassandra

Dockerfile for [Apache Cassandra](https://cassandra.apache.org/)

Docker images built from this Dockerfile are available from
[Docker Hub](https://hub.docker.com/r/b9company/cassandra/)

## Usage

```
docker run -ti b9company/cassandra:3.11.1
```

## Image Information

This is no information pertaining to this section.

## Build Notes

The Docker image can be tailored through variables during the build process.
Note that `CASSANDRA_VERSION` is a required variable in order to specify which
Cassandra version to build.

| Build-time Variable | Description |
| ------------------- | ----------- |
| `CASSANDRA_VERSION` | **Mandatory**. Cassandra version to build. |

To build `b9company/cassandra:3.11.1` Docker image, run:

```
make build CASSANDRA_VERSION=3.11.1
```
