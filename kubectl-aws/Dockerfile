FROM alpine:3.17 as builder

RUN apk --update add --no-cache libstdc++ libgcc curl upx bash \
  && rm -rf /var/cache/apk/*

ARG KUBE_VERSION
RUN curl -L -o /usr/local/bin/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl

RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
  && unzip awscliv2.zip \
  && aws/install 
