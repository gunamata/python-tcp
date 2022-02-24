FROM python:3

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    python3-pip

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y iputils-ping
RUN apt-get update && apt-get install -y telnet

COPY client.py /app/client.py
