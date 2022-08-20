FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
# RUN apt-get install -y gcc python-dev libkrb5-dev 
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade virtualenv
RUN apt install krb5-user -y
RUN pip3 install pywinrm
RUN pip3 install ansible
RUN apt install -y openssh-client
RUN apt install -y openssh-server
RUN apt install -y sshpass
RUN mkdir -p /etc/ansible
COPY configs/ansible.cfg /etc/ansible/ansible.cfg
COPY configs/hosts /etc/ansible/hosts
COPY configs/playbook.yml /home/playbook.yml
COPY configs/cassandra.yaml /home/cassandra.yaml