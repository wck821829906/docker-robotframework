FROM ubuntu:latest

MAINTAINER john.wang <wywincl@126.com>

# Install python and pip
RUN apt-get -y update \
    && apt-get install -y python python-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install robotframework
RUN pip install robotframework-selenium2library
RUN pip install requests
RUN pip install robotframework-requests

RUN mkdir /robot
VOLUME /robot
WORKDIR /robot

ADD entry-point.sh /entry-point.sh

ENTRYPOINT ["/entry-point.sh"]
