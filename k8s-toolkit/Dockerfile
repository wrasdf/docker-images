FROM alpine:3.14 as builder

RUN apk --update add --no-cache libstdc++ libgcc curl upx \
  && rm -rf /var/cache/apk/*

ARG KUBE_VERSION
RUN echo installing kubectl version v${KUBE_VERSION} \
  && curl -L -o /usr/local/bin/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl

ARG GOMPLATE_VERSION
RUN curl -o /usr/local/bin/gomplate -sSL https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64 \
  && chmod 755 /usr/local/bin/gomplate

ARG YQ_VERSION
RUN curl -sSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64.tar.gz \
  | tar -C /tmp --no-same-owner -xvzf - \
  && mv /tmp/yq_linux_amd64 /usr/local/bin/yq

RUN upx \
  /usr/local/bin/kubectl \
  /usr/local/bin/gomplate \
  /usr/local/bin/yq

FROM python:3.9.6-alpine3.14 as release

RUN apk --update add --no-cache \
  libstdc++ libgcc openssl coreutils util-linux git \
  ruby ruby-json ca-certificates \
  curl jq bash \
  && rm -rf /var/cache/apk/* \
  && echo 'gem: --no-document' > /etc/gemrc \
  && pip install --upgrade pip \
  && pip install --upgrade awscli yamllint \
  && gem install stackup \
  && rm -rf $HOME/.cache

COPY --from=builder --chown=root:root \
  /usr/local/bin/kubectl \
  /usr/local/bin/gomplate \
  /usr/local/bin/yq \
  /usr/local/bin/
