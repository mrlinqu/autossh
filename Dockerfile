FROM alpine:3.23

RUN apk --no-cache --no-progress upgrade
RUN apk --no-cache --no-progress add openssh-client autossh

COPY entripoint.sh /entripoint.sh

RUN mkdir /root/.ssh \
    && chmod 0700 /root/.ssh \
    && chmod 0755 /entripoint.sh

ENV HOST=""
ENV PORT="22"
ENV L=""
ENV D=""

ENTRYPOINT ["/entripoint.sh"]
