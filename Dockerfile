FROM amazonlinux:latest

RUN yum install -y awscli tar
RUN yum install -y amazon-efs-utils
RUN pip3 install botocore

COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]