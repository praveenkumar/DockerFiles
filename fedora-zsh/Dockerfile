FROM fedora
MAINTAINER Praveen Kumar <kumarpraveen.nitdgp@gmail.com>

ENV ZNC_VERSION=1.6.3 \
    DATADIR=/var/lib/znc-data

LABEL summary="ZNC is an IRC bouncer" \
      io.k8s.description="ZNC is an IRC bouncer" \
      io.k8s.display-name="ZNC 1.6.3" \
      io.openshift.expose-services="6667:znc" \
      io.openshift.tags="znc,ircbouncer"


EXPOSE 6667

RUN INSTALL_PKGS="rsync tar gettext hostname bind-utils policycoreutils znc znc-devel" && \
    dnf install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    dnf clean all && \
    mkdir -p /var/lib/znc-data && chown -R znc.0 /var/lib/znc-data && \
    test "$(id znc)" = "uid=995(znc) gid=994(znc) groups=994(znc)"

ENV CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/znc

ADD root /

VOLUME ["/var/lib/znc-data"]

USER 995
ENTRYPOINT ["container-entrypoint"]
CMD ["run-znc"]
