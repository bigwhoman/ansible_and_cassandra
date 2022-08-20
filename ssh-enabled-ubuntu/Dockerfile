# FROM centos:7

# # RUN yum update
# RUN yum -y install openssh-server
# RUN mkdir /var/run/sshd
# RUN echo 'root:mypassword' | chpasswd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]
FROM centos:7
RUN yum install -y openssh openssh-server openssh-clients java-1.8.0-openjdk initscripts epel-release firewalld
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN /bin/echo 'root:mypassword'|chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
COPY systemctl.py /usr/bin/systemctl
COPY cassandra.repo /etc/yum.repos.d/
RUN yum install -y cassandra
RUN chmod a+x /usr/bin/systemctl
# RUN ufw service start
RUN sed -i -e 's/\r$//' /bin/systemctl
EXPOSE      22
CMD         /usr/sbin/sshd -D