# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=latest

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
MAINTAINER Juri

# Install Java 8 for Datastore emulator
RUN apk add --update --no-cache openjdk8-jre &&\
    gcloud components install cloud-datastore-emulator --quiet

# Volume to persist Datastore data
VOLUME /data

COPY datastore-init.sh .

EXPOSE 8081

ENTRYPOINT ["./datastore-init.sh"]
