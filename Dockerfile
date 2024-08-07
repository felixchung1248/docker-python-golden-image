FROM ubuntu:24.04

# Set the environment variable
ENV SPARK_HOME=/opt/spark
ENV PATH="${PATH}:/usr/local/go/bin:/root/go/bin:${SPARK_HOME}/bin"

ADD go1.21.5.linux-amd64.tar.gz /usr/local
ADD terraform.zip .
ADD requirements.txt .

RUN apt update -y && apt upgrade -y \
	&& apt install -y software-properties-common \
	&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y tzdata \
    && apt install -y unzip sudo curl wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev \
	&& apt install -y default-jdk \
	&& apt install -y python3.12 \
	&& apt install -y python3-pip \	
	&& apt install -y libpq-dev python3-dev \
	&& pip install -r requirements.txt --break-system-packages \
	&& unzip terraform.zip \
	&& cd terraform && go install \
	&& wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz \
	&& tar xvf spark-3.5.1-bin-hadoop3.tgz \
	&& mv spark-3.5.1-bin-hadoop3 /opt/spark \
	&& apt update -y \
	&& apt install -y nodejs


	
