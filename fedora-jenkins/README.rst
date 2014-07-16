===========
Fedora-Jenkins
===========

Fedora docker file for ssh and jenkins service which managed by supervisor

:MAINTAINER:
        Praveen Kumar
        kumarpraveen.nitdgp@gmail.com


**Built and Tested on** Docker-0.11.1

HOW TO BUILD
------------

- Execute: docker build -rm -t kumarpraveen/fedora-jenkins
        + rm - Remove intermediate containers
        + t - Build tag

HOW TO RUN
----------

- Execute: docker run -d -p -t 22 -p 8080 kumarpraveen/fedora-jenkins
        + d - Run as daemon
        + p - Expose port
        + t - TTY supportt

CHECK DOCKER STATUS
-------------------

- Execute: docker ps
        + It will list running container and provide container ID

CHECK CONTAINER IP and Port binding
-----------------------------------

- Execute: docker inspect <Container_ID> | grep IP
- Execute: docker inspect <Container_ID> | grep Port

TEST SSH SERVICE
----------------
- Execute: ssh root@<container_IP>
        + default root passwd is "password" for this image
