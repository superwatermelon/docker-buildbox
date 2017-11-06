FROM alpine:latest

ARG user=buildbox
ARG group=buildbox
ARG uid=1000
ARG gid=1000

RUN addgroup -g ${gid} ${group} && \
  adduser -u ${uid} -G ${group} -D ${user} && \
  apk --no-cache add build-base bash python3 ca-certificates bats \
    nodejs nodejs-npm jq libsass openssl git docker && \
  pip3 install --upgrade pip && \
  pip3 install virtualenv awscli && \
  npm install --global npm node-gyp node-sass && \
  wget https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip && \
  unzip terraform_0.10.8_linux_amd64.zip && \
  mv terraform /usr/local/bin/terraform && \
  mkdir /home/${user}/.aws && \
  chown ${uid}:${gid} /home/${user}/.aws

COPY scripts/buildbox-* /usr/local/bin/

WORKDIR /home/${user}
VOLUME /home/${user}
USER ${user}
