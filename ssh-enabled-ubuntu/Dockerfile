
FROM ubuntu:latest
RUN apt update && apt install openssh-server sudo -y
RUN apt install default-jdk -y
RUN echo "deb http://www.apache.org/dist/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN wget -q -O - https://www.apache.org/dist/cassandra/KEYS | sudo tee /etc/apt/trusted.gpg.d/cassandra.asc
RUN sudo apt update
RUN sudo apt install cassandra -y
RUN sudo apt install iproute2 -y
RUN service cassandra restart
RUN  echo 'root:mypassword' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]



# FROM centos:7
# RUN yum makecache
# RUN yum install -y openssh openssh-server openssh-clients java-1.8.0-openjdk initscripts epel-release firewalld
# RUN mkdir -p /var/run/sshd
# RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
# RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
# RUN /bin/echo 'root:mypassword'|chpasswd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# COPY systemctl.py /usr/bin/systemctl
# COPY cassandra.repo /etc/yum.repos.d/
# RUN yum install -y cassandra
# RUN chmod a+x /usr/bin/systemctl
# RUN sed -i -e 's/\r$//' /bin/systemctl
# EXPOSE      22
# CMD ["/usr/sbin/init"]
# CMD         /usr/sbin/sshd -D