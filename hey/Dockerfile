FROM alpine:3.14.3 as release

RUN apk --update add --no-cache libstdc++ libgcc curl bash \
  && rm -rf /var/cache/apk/*

RUN echo installing hey version -> latest \
  && curl -L -o /usr/local/bin/hey \
  https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 \
  && chmod +x /usr/local/bin/hey

