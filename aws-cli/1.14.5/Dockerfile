FROM alpine:3.6

RUN apk -v --update add python python-dev py-pip make curl bash jq openssl \
    && rm -rf /var/cache/apk/*

ENV AWSCLIVERSION 1.14.5
ENV S3CMDVERSION 2.0.1

RUN pip install --upgrade awscli==${AWSCLIVERSION} s3cmd==${S3CMDVERSION}

ENTRYPOINT ["aws"]
