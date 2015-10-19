FROM centos:latest
MAINTAINER Praveen Kumar "kumarpraveen.nitdgp@gmail.com"

RUN yum -y update
RUN yum -y install java
RUN curl http://pkg.jenkins-ci.org/redhat/jenkins.repo > /etc/yum.repos.d/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum -y install jenkins

ADD etc/jenkins /etc/init.d/jenkins
RUN chmod +x /etc/init.d/jenkins

ADD start.sh /scripts/start.sh
RUN chmod +x /scripts/start.sh

EXPOSE 8080

VOLUME ["/var/lib/jenkins"]

ENTRYPOINT ["/scripts/start.sh"]
