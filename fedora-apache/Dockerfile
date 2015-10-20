FROM kumarpraveen/fedora-systemd
MAINTAINER Praveen Kumar <kumarpraveen.nitdgp@gmail.com>

RUN dnf install -y httpd && dnf clean all

RUN systemctl enable httpd.service

EXPOSE 80

CMD ["/usr/sbin/init"]
