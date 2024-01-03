FROM ubuntu:20.04

RUN apt update && apt upgrade && \
    apt install -y wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev &&\
	add-apt-repository ppa:deadsnakes/ppa &&\
	apt install -y python3.11
	
