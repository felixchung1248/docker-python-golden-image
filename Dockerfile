FROM ubuntu:22.04

RUN apt update -y && apt upgrade -y \
	&& apt-get update \
	&& apt install -y gnupg software-properties-common \
	&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y tzdata \
    && apt install -y sudo curl wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev \
	&& add-apt-repository ppa:deadsnakes/ppa \
	&& apt install -y python3.11 \
	&& apt install -y python3-pip \
	&& pip install mo-sql-parsing requests flask --break-system-packages \
	&& wget -O- https://apt.releases.hashicorp.com/gpg | \
		gpg --dearmor | \
		sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
	&& echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
	https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
	sudo tee /etc/apt/sources.list.d/hashicorp.list \
	&& sudo apt update \
	&& sudo apt-get install terraform
	


	
