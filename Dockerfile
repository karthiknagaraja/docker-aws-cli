FROM python:latest
MAINTAINER Vijayakumar Jawaharlal (vijayakumar.jawaharlal@gmail.com)

ADD https://releases.hashicorp.com/terraform/0.6.9/terraform_0.6.9_linux_amd64.zip /

RUN \
	apt-get update && \
	pip install boto3 && \
	pip install awscli && \
	pip install aws-shell && \
	apt-get install unzip -y && \
	apt-get install dos2unix -y && \
	apt-get install -y postgresql postgresql-contrib && \
	apt-get install -y openssh-server openssh-client

RUN \
	unzip terraform_0.6.9_linux_amd64.zip -d /usr/bin/ && \
	echo "export PATH=\$PATH:/terraform" >> .bashrc && \
	rm -fr /terraform_0.6.9_linux_amd64.zip

