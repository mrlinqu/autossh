FROM alpine:3.23

RUN apk --no-cache --no-progress upgrade
RUN apk --no-cache --no-progress add openssh-client autossh

RUN mkdir /root/.ssh \
    && chmod 0700 /root/.ssh.

COPY entripoint.sh /entripoint.sh

ENV HOST
ENV PORT
ENV L
ENV D

ENTRYPOINT ["/entripoint.sh"]
