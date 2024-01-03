FROM ubuntu:20.04

ADD Python-3.11.5.tgz .
RUN cd Python-3.11.5 && \
	./configure --enable-optimizations && \
	make altinstall 
