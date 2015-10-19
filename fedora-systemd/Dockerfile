FROM fedora:latest
MAINTAINER Praveen Kumar <kumarpraveen.nitdgp@gmail.com>

RUN dnf -y update; dnf clean all

RUN systemctl mask systemd-remount-fs.service \
    dev-hugepages.mount sys-fs-fuse-connections.mount \
    systemd-logind.service getty.target console-getty.service

VOLUME ["/sys/fs/cgroup", "/run", "/tmp"]
ENV container=docker

CMD ["/usr/sbin/init"]
