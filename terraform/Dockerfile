ARG TERRAFORM_VERSION

FROM alpine:3.14 as builder
RUN apk --update add --no-cache libstdc++ libgcc curl upx \
  && rm -rf /var/cache/apk/*

ARG GOMPLATE_VERSION
RUN curl -o /usr/local/bin/gomplate -sSL https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64 \
  && chmod 755 /usr/local/bin/gomplate

ARG YQ_VERSION
RUN curl -sSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64.tar.gz \
  | tar -C /tmp --no-same-owner -xvzf - \
  && mv /tmp/yq_linux_amd64 /usr/local/bin/yq

RUN upx \
  /usr/local/bin/gomplate \
  /usr/local/bin/yq

FROM hashicorp/terraform:${TERRAFORM_VERSION} as release
RUN apk --update add --no-cache libstdc++ libgcc bash \
  && rm -rf /var/cache/apk/*

COPY --from=builder --chown=root:root \
  /usr/local/bin/gomplate \
  /usr/local/bin/yq \
  /usr/local/bin/

CMD ["/bin/bash"]