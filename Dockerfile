# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=latest

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
MAINTAINER Juri

# Install Datastore emulator
RUN apt-get -qqy update &&\
    apt-get install -qqy google-cloud-sdk-datastore-emulator

# Volume to persist Datastore data
VOLUME /data

COPY datastore-init.sh .

EXPOSE 8081

ENTRYPOINT ["./datastore-init.sh"]
