FROM alpine:3.14
RUN apk --update add --no-cache libstdc++ libgcc curl \
  && rm -rf /var/cache/apk/*

ENV AWSIAMAUTHENTICATOR v0.5.3
RUN curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/${AWSIAMAUTHENTICATOR}/aws-iam-authenticator_${AWSIAMAUTHENTICATOR}_linux_amd64 -o /usr/local/bin/aws-iam-authenticator
RUN chmod +x /usr/local/bin/aws-iam-authenticator

ENTRYPOINT ["aws-iam-authenticator"]
