FROM fedora:latest
MAINTAINER Praveen Kumar "kumarpraveen.nitdgp@gmail.com"

RUN dnf -y update
RUN dnf -y install python-ipython python-virtualenv openssl supervisor

RUN useradd -m ipython
RUN mkdir -p /notebooks
RUN chown -R ipython:ipython /notebooks

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 7777

ENV PEM_FILE /key.pem
# $PASSWORD will get `unset` within notebook.sh, turned into an IPython style hash
ENV PASSWORD Dont make this default
ENV USE_HTTP 0

ADD supervisord.conf /etc/supervisord.conf
ADD notebook.sh /
RUN chmod +x /notebook.sh

USER ipython
ENTRYPOINT ["/usr/bin/supervisord", "-l", "~/super.log", "-u", "ipython", "-n"]
