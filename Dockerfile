FROM openjdk:8-jre-alpine
FROM centos:7
FROM java:openjdk-7-jdk
MAINTAINER Sankalan <banerjee.sankalan2@gmail.com>

# SOAP UI Version to download
ENV SOAPUI_VERSION 5.2.1

# Download and unarchive SoapUI
RUN mkdir -p /tmp &&\
    curl  http://smartbearsoftware.com/distrib/soapui/5.2.1/SoapUI-5.2.1-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    #ln -s /tmp/SoapUI-${SOAPUI_VERSION} /tmp/SoapUI
    ln -s /tmp/SoapUI-${SOAPUI_VERSION} /var/lib/docker/volumes/SoapUI

COPY docker-entrypoint.sh /tmp/SoapUI/docker-entrypoint.sh
RUN chmod +x /tmp/SoapUI/docker-entrypoint.sh

# Set environment
ENV PATH ${PATH}:/var/lib/docker/volumes/SoapUI/bin
WORKDIR /var/lib/docker/volumes/SoapUI/bin

ENTRYPOINT ["/tmp/SoapUI/docker-entrypoint.sh"]
