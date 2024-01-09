FROM ubuntu:24.04

RUN apt update -y && apt upgrade -y \
	&& apt-get update \
	&& apt install -y gnupg software-properties-common \
	&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y tzdata \
    && apt install -y curl wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev \
	&& add-apt-repository ppa:deadsnakes/ppa \
	&& apt install -y python3.11 \
	&& apt install -y python3-pip \
	&& pip install mo-sql-parsing requests flask --break-system-packages \
	&& curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --yes --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list > /dev/null \
	&& apt update \
	&& apt-get -y install terraform	
	
