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
RUN yum install -y openssh openssh-server openssh-clients
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN /bin/echo 'root:mypassword'|chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
COPY systemctl.py /usr/bin/systemctl
RUN chmod a+x /usr/bin/systemctl
# RUN         useradd dys
# RUN         /bin/echo 'dys:mypas'|chpasswd
# RUN        sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g'/etc/pam.d/sshd
# RUN         /bin/echo -e "LANG=\"en_US.UTF-8\"">/etc/default/local
EXPOSE      22
CMD         /usr/sbin/sshd -D