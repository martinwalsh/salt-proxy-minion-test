FROM alpine:3.8
# RUN apk add --no-cache salt-master tini

RUN apk add --no-cache python2 py2-pip py2-crypto curl tini g++ make python-dev && \
      curl -LO https://github.com/saltstack/salt/releases/download/v2018.3.2/salt-2018.3.2.tar.gz && \
      curl -LO https://github.com/saltstack/salt/pull/46804.patch && \
      curl -LO https://github.com/saltstack/salt/pull/49019.patch && \
      tar xf salt-2018.3.2.tar.gz && \
      ( \
        cd salt-2018.3.2 && \
        patch -p1 < ../46804.patch && \
        patch -p1 < ../49019.patch && \
        pip2 install . ) && \
      rm -rf salt-2018.3.2

COPY master.conf /etc/salt/master
COPY autosign_grains /etc/salt/autosign_grains
# ADD pillar /srv/pillar

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["salt-master", "--log-level", "info"]
