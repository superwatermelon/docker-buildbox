FROM alpine:latest
ARG user=buildbox
ARG group=buildbox
ARG uid=1000
ARG gid=1000
RUN addgroup -g ${gid} ${group} && \
  adduser -u ${uid} -G ${group} -D ${user} && \
  apk --no-cache add python3 terraform build-base && \
  pip3 install --upgrade pip && \
  pip3 install virtualenv awscli
WORKDIR /home/${user}
VOLUME /home/${user}
USER ${user}