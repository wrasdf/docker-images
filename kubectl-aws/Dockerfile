FROM alpine:3.17 as release

RUN apk --update add --no-cache libstdc++ libgcc curl bash aws-cli bind-tools \
  && rm -rf /var/cache/apk/*

ENV KUBE_VERSION=1.28.2
RUN curl -L -o /usr/local/bin/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl
