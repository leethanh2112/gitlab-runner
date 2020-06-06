FROM centos:centos7
MAINTAINER ThanhCL

#updated os, install some lib packages
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
  rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && \
  yum clean all && \
  yum install -y epel-release && \
  yum install -y ansible librdkafka-devel nginx python python-requests python-pip python-devel telnet tcptraceroute mtr git patch libselinux-python libsemanage-python libselinux-python ntp unzip wget make mlocate gcc net-tools && \
  rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash
RUN yum install pygpgme yum-utils
RUN  yum install gitlab-runner

#WORKDIR /usr/src
#COPY script.rpm.sh /usr/src
#RUN chmod 755 script.rpm.sh
#RUN sh script.rpm.sh
#RUN yum install gitlab-runner
