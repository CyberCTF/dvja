# Upstream

| | |
| --- | --- |
| Project | Damn Vulnerable Java Application (DVJA) |
| Repository | https://github.com/appsecco/dvja |
| Version | master (no release tags) |
| Commit | 597ece1ab79ffffea7289d49b0c443bb2ebcbd16 |
| Licence | MIT |

`build/web/app/` is that commit, unchanged, without its Git history. `build/web/Dockerfile` is
upstream's Dockerfile with these changes: its base `openjdk:8` is gone from Docker Hub, so it
builds from `eclipse-temurin:8-jdk-jammy` (same Java 8, Maven and the MySQL client from apt);
the database credentials from upstream's `docker-compose.yml` are baked in; and the Jetty plugin
the start script runs is resolved at build time, so the container needs no internet. Dependency
versions are pinned in upstream's `pom.xml`. `build/mysql/Dockerfile` is upstream's `mysql:5.5`
with its compose environment baked in. To update, replace `build/web/app/` with a newer commit,
then change this table.
