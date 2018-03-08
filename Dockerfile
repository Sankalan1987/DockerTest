FROM openjdk:8-jre-alpine
FROM ubuntu:14.04
MAINTAINER Sankalan <banerjee.sankalan2@gmail.com>

# Install curl
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*
	
# SOAP UI Version to download
ENV SOAPUI_VERSION 5.2.1

# Download and unarchive SoapUI
RUN mkdir -p /opt &&\
    curl  http://cdn01.downloads.smartbear.com/soapui/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

# Set environment
ENV PATH ${PATH}:/opt/SoapUI/bin

WORKDIR /opt/SoapUI/bin

ADD docker-entrypoint.sh /opt/SoapUI

ENTRYPOINT ["/opt/SoapUI/docker-entrypoint.sh"]
