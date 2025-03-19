FROM nickblah/pgrouting:14.12-postgis-3.4.2-pgrouting-3.6.2

## Befor `FROM` is previous stage,
## after `FROM` is current stage.
## It is required to declare again in current stage.
ARG PG_VER=14

RUN echo "en_US.UTF-8 UTF-8"> /etc/locale.gen 
RUN locale-gen

## Install required packages.
RUN apt-get update && \
    apt-get install -y postgresql-${PG_VER}-pgvector \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
