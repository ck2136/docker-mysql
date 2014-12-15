FROM centurylink/mysql:latest
MAINTAINER lec00q

RUN apt-get update
RUN apt-get install -y python-dev python-pip python-mysqldb

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p /tmp/db
WORKDIR /tmp/db
