FROM centos:latest
MAINTAINER Praveen Kumar "kumarpraveen.nitdgp@gmail.com"

RUN yum -y update && yum -y install java initscripts && yum clean all
RUN curl http://pkg.jenkins-ci.org/redhat/jenkins.repo > /etc/yum.repos.d/jenkins.repo
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum clean all
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum -y install jenkins supervisor && yum clean all

RUN rm -rf /var/run/jenkins.pid

VOLUME ["/var/lib/jenkins"]

EXPOSE 8080

ADD supervisord.conf /etc/supervisord.conf

CMD [ "supervisord", "-n" ]
