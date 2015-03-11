===============
Fedora-packager
===============

Fedora docker file for fedora packager purpose

:MAINTAINER:
        Praveen Kumar
        kumarpraveen.nitdgp@gmail.com


**Built and Tested on** Docker-1.5

HOW TO BUILD
------------

- Execute: docker build --rm -t fedora-packager
        + rm - Remove intermediate containers
        + t - Build tag

HOW TO RUN
----------

- Execute: docker run -it --rm -v /home/$USER/.ssh:/home/packager/.ssh:ro kumarpraveen/fedora-packager /bin/bash

        + d - Run as daemon
        + p - Expose port

CHECK DOCKER STATUS
-------------------

- Execute: docker ps
        + It will list running container and provide container ID

CHECK CONTAINER IP
------------------

- Execute: docker inspect <Container_ID> | grep IP
