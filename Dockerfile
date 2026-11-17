# syntax=docker/dockerfile:1
# check=error=true

FROM pgvector/pgvector:pg18@sha256:2358fcba361ed2233a5ed81b5fe4ca779ccb304120ce531a3bf51c0ed7e2bc11

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
      pgbackrest=2.60.0-1.pgdg12+1 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
