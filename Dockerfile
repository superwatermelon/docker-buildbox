FROM alpine:latest
ARG user=buildbox
ARG group=buildbox
ARG uid=1000
ARG gid=1000
RUN addgroup -g ${gid} ${group} && \
  adduser -u ${uid} -G ${group} -D ${user} && \
  apk --no-cache add build-base bash python3 terraform ca-certificates bats \
    nodejs nodejs-npm jq libsass openssl git && \
  pip3 install --upgrade pip && \
  pip3 install virtualenv awscli && \
  npm install --global npm node-gyp node-sass && \
  wget https://get.docker.com/builds/Linux/x86_64/docker-1.12.6.tgz && \
  tar -xzvf docker-1.12.6.tgz && \
  ln -s /docker/docker /usr/local/bin/docker
WORKDIR /home/${user}
VOLUME /home/${user}
USER ${user}
