=============
Fedora-apache
=============

Fedora docker file for apache server managed by systemd

:MAINTAINER:
        Praveen Kumar
        kumarpraveen.nitdgp@gmail.com


**Built and Tested on** Docker-1.8.1

HOW TO BUILD
------------

- Execute: docker build -t fedora-apache .
        + t - Build tag

HOW TO RUN
----------

- Execute: docker run -d -p 80:80 -v /sys/fs/cgroup:/sys/fs/cgroup fedora-apache
        + d - Run as daemon
        + p - Expose port

CHECK DOCKER STATUS
-------------------

- Execute: docker ps
        + It will list running container and provide container ID

CHECK CONTAINER IP
------------------

- Execute: docker inspect <Container_ID> | grep IP
