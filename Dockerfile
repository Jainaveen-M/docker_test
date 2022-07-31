FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* &&\
    chmod 777 opt
RUN yum -y install git &&\
    yum -y install curl &&\
    yum -y install unzip 
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - &&\
    yum -y install nodejs
RUN git clone https://github.com/flutter/flutter.git -b 2.10.5
ENV PATH="/flutter/bin:$PATH"
RUN flutter precache
RUN flutter doctor
