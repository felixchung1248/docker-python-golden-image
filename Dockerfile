FROM ubuntu:24.04

RUN apt update -y && apt upgrade -y && \
	apt install -y software-properties-common && \
	DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y tzdata && \
    apt install -y wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev &&\
	add-apt-repository ppa:deadsnakes/ppa &&\
	apt install -y python3.11 &&\
	apt install -y python3-pip &&\
	pip install mo-sql-parsing requests
	
