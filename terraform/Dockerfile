FROM alpine:3.19.1 as builder
RUN apk --update add --no-cache libstdc++ libgcc curl upx \
  && rm -rf /var/cache/apk/* 

ENV GOMPLATE_VERSION=v3.11.7
RUN curl -o /usr/local/bin/gomplate -sSL https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64 \
  && chmod +x /usr/local/bin/gomplate

ENV YQ_VERSION=v4.21.1
RUN curl -sSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64.tar.gz \
  | tar -C /tmp --no-same-owner -xvzf - \
  && mv /tmp/yq_linux_amd64 /usr/local/bin/yq \
  && chmod +x /usr/local/bin/yq

FROM hashicorp/terraform:1.7.3 as release
RUN apk --update add --no-cache libstdc++ libgcc bash aws-cli bind-tools \
  && rm -rf /var/cache/apk/*

COPY --from=builder --chown=root:root \
  /usr/local/bin/gomplate \
  /usr/local/bin/yq \
  /usr/local/bin/

CMD ["/bin/bash"]