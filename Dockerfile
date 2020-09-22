FROM gradle:6.6-jdk11 AS build
ARG app_version
COPY ./ .
RUN gradle build -Prelease_version=$app_version