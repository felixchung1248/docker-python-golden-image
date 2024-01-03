FROM ubuntu:20.04

ADD Python-3.11.5.tgz .
RUN ls -l && \
	tar xzf Python-3.11.5.tgz && \
	cd Python-3.11.3 && \
	./configure --enable-optimizations && \
	make altinstall 
