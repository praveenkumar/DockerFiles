===========
Fedora-sshd
===========

Fedora docker file for ssh service which managed by supervisor

:MAINTAINER:
        Praveen Kumar
        kumarpraveen.nitdgp@gmail.com


**Built and Tested on** Docker-8.0

HOW TO BUILD
------------

- Execute: docker build -rm -t /fedora-ssh 
        + rm - Remove intermediate containers
        + t - Build tag

HOW TO RUN
----------

- Execute: docker run -d -p 22 /fedora-ssh
        + d - Run as daemon
        + p - Expose port

CHECK DOCKER STATUS
-------------------

- Execute: docker ps
        + It will list running container and provide container ID

CHECK CONTAINER IP
------------------

- Execute: docker inspect <Container_ID> | grep IP

TEST SSH SERVICE
----------------
- Execute: ssh root@<container_IP>
        + default root passwd is password for This image

