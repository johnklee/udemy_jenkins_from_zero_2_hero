FROM centos:8
RUN yum -y install openssh-server net-tools
RUN yum -y install mysql
RUN uname -a
RUN useradd remote_user && \
    echo "remote_user:verysecure" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys
RUN chown remote_user:remote_user -R /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys


RUN dnf install -y python3-pip
RUN pip3 install awscli --upgrade
RUN echo 'PS1="\e[0;31m[\u@remotehost \W]# \e[m "' >> ~/.bashrc
RUN source ~/.bashrc

RUN rm -f /run/nologin
RUN ssh-keygen -A
CMD /usr/sbin/sshd -D
