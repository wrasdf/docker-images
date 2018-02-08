FROM python:2.7.12-alpine

ENV VERSION 0.6.1
RUN apk --update add gcc build-base libxml2-dev libxslt-dev libffi-dev openssl-dev && \
  rm -rf /tmp/* /var/cache/apk/*

RUN pip install --upgrade aws-adfs==${VERSION}

CMD ["aws-adfs"]
