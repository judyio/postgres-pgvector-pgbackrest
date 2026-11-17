# PostgreSQL 18 with pgvector and pgBackRest

A PostgreSQL container image with the [pgvector](https://github.com/pgvector/pgvector) extension and [pgBackRest](https://pgbackrest.org/) backup tool. It extends `pgvector/pgvector:pg18` pinned to `sha256:2358fcba361ed2233a5ed81b5fe4ca779ccb304120ce531a3bf51c0ed7e2bc11` and installs pgBackRest `2.60.0-1.pgdg12+1`. The upstream entrypoint and PostgreSQL 18 data directory (`/var/lib/postgresql/18/docker`) are retained.

## Pull and run

Release tags use `postgres-v*` and are published for Linux AMD64 and ARM64. There is no `latest` tag. After a release is published, replace `<release>` with its tag:

```sh
docker pull ghcr.io/judyio/postgres-pgvector-pgbackrest:<release>
docker run --name postgres -e POSTGRES_PASSWORD=change-me -d ghcr.io/judyio/postgres-pgvector-pgbackrest:<release>
```

For reproducible deployments, pin the multi-platform image index digest as `<release>@sha256:<index-digest>`. Backup configuration and credentials are supplied by the installation at runtime; this image contains neither.

## Build and check locally

```sh
docker build -t postgres-check .
./test-image postgres-check
```

The smoke test starts a temporary database, creates the vector extension, runs a vector query, and checks PostgreSQL's backup tools and pgBackRest. Pull requests run it on AMD64 and ARM64. Pushing a `postgres-v*` tag builds and checks both architectures, then publishes a multi-platform image to GHCR.
