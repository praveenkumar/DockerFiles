FROM kumarpraveen/fedora-systemd
MAINTAINER Praveen Kumar <kumarpraveen.nitdgp@gmail.com>

RUN dnf -y update && dnf install -y httpd && dnf clean all

RUN systemctl enable httpd.service

RUN systemctl mask systemd-remount-fs.service

EXPOSE 80

CMD ["/usr/sbin/init"]
