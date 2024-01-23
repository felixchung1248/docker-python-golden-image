FROM ubuntu:24.04

# Set the environment variable
ENV PATH="${PATH}:/usr/local/go/bin:/root/go/bin"

ADD go1.21.5.linux-amd64.tar.gz /usr/local
ADD terraform.zip .

RUN apt update -y && apt upgrade -y \
	&& apt install -y software-properties-common \
	&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y tzdata \
    && apt install -y unzip sudo curl wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev \
##	&& add-apt-repository ppa:deadsnakes/ppa \
	&& apt install -y python3.11 \
	&& apt install -y python3-pip \	
	&& apt install -y libpq-dev python3-dev \
	&& pip install mo-sql-parsing requests flask psycopg2  --break-system-packages \
	&& pip install --upgrade pip --break-system-packages \
	&& python3 -m pip install --upgrade setuptools --break-system-packages \
	&& pip install --no-cache-dir grpcio --break-system-packages \
	&& pip install openmetadata-ingestion~=0.13.0 --break-system-packages \
	&& unzip terraform.zip \
	&& cd terraform && go install


	
