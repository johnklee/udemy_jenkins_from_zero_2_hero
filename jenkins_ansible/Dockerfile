FROM jenkins/jenkins:2.218-centos

USER root
RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y python3-pip
RUN dnf install -y maven
RUN dnf -y install sshpass
RUN pip3 install ansible --upgrade

# Install Docker
RUN dnf clean all && rm -r /var/cache/dnf  && dnf upgrade -y && dnf update -y & echo hostname
RUN dnf install -y glibc-langpack-en
RUN dnf -y install dnf-plugins-core
RUN dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
# RUN dnf update -y
# RUN dnf config-manager --set-enabled docker-ce-test
# RUN dnf config-manager --set-disabled docker-ce-stable
RUN dnf list docker-ce --showduplicates | sort -r
# RUN dnf -y install docker-ce-3:18.09.1-3.el7
RUN dnf -y install docker-ce-3:18.09.1-3.el7 docker-ce-cli containerd.io
# RUN dnf systemctl enable docker
# RUN dnf systemctl start docker

# docker-commpose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

RUN echo 'PS1="\e[0;31m[\u@jenkins \W]# \e[m "' >> ~/.bashrc
RUN source ~/.bashrc

USER jenkins
