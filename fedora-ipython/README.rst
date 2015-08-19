===========
Fedora-Jenkins
===========

Fedora docker file for ipython notebook service which managed by supervisor

:MAINTAINER:
        Praveen Kumar
        kumarpraveen.nitdgp@gmail.com


**Built and Tested on** Docker-1.6.2.fc21

HOW TO BUILD
------------

- Execute: docker build --rm -t kumarpraveen/fedora-ipython .
        + rm - Remove intermediate containers
        + t - Build tag

HOW TO RUN
----------

- Execute: docker run -d -p 7777:7777 -v <share_volume>:/notebooks:z -e PASSWORD=<your_passwod> -e PEM_FILE=/tmp/key.pem kumarpraveen/fedora-ipython
        + d - Run as daemon
        + p - Expose port
        + e - Environment variable

CHECK DOCKER STATUS
-------------------

- Execute: docker ps
        + It will list running container and provide container ID

CHECK CONTAINER IP and Port binding
-----------------------------------

- Execute: docker inspect <Container_ID> | grep IP
- Execute: docker port <Container_ID>

TEST ipython-notebook service running
-------------------------------------
- Execute: docker logs <Container_ID>

::

    2015-08-19 05:48:35,862 CRIT Set uid to user 1000
    2015-08-19 05:48:36,029 INFO RPC interface 'supervisor' initialized
    2015-08-19 05:48:36,029 CRIT Server 'unix_http_server' running without any HTTP authentication checking
    2015-08-19 05:48:36,030 INFO supervisord started with pid 1
    2015-08-19 05:48:37,038 INFO spawned: 'notebook' with pid 14
    2015-08-19 05:48:38,043 INFO success: notebook entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
