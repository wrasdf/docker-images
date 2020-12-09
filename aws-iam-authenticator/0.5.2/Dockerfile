FROM alpine:3.10
RUN apk --update add --no-cache libstdc++ libgcc curl \
  && rm -rf /var/cache/apk/*

RUN curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.2/aws-iam-authenticator_0.5.2_linux_amd64 -o /usr/local/bin/aws-iam-authenticator
RUN chmod +x /usr/local/bin/aws-iam-authenticator

ENTRYPOINT ["aws-iam-authenticator"]
