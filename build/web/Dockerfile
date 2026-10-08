# Upstream's Dockerfile (app/Dockerfile) with these changes:
# - its base openjdk:8 is gone from Docker Hub, so it builds FROM eclipse-temurin:8-jdk-jammy
#   (the same Java 8; Maven and the MySQL client still come from apt);
# - the database credentials upstream's docker-compose.yml passes are baked in (ENV MYSQL_*);
#   the database host `mysql` is already in the source's config.properties;
# - the Jetty plugin the start script runs (mvn jetty:run) is resolved at build time
#   (mvn jetty:run -Djetty.skip=true), so the container starts without internet access;
# - COPY reads app/.
FROM eclipse-temurin:8-jdk-jammy
MAINTAINER Abhisek Datta <abhisek@appsecco.com>

RUN apt-get update
RUN apt-get install -y default-mysql-client
RUN apt-get install -y maven

ENV MYSQL_USER=root \
    MYSQL_PASSWORD=ec95c258266b8e985848cae688effa2b

WORKDIR /app
COPY app/pom.xml pom.xml
RUN mvn dependency:resolve

COPY app/ .
RUN mvn clean package
RUN mvn jetty:run -Djetty.skip=true
RUN chmod 755 /app/scripts/start.sh

EXPOSE 8080
CMD ["sh", "-c", "/app/scripts/start.sh"]
