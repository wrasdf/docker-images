FROM python:3.9.6-alpine3.14

ENV VERSION 1.24.5
RUN apk --update add gcc musl-dev libxml2-dev libxslt-dev libffi-dev krb5-dev openssl-dev cargo  && \
  rm -rf /tmp/* /var/cache/apk/*

RUN pip install --upgrade pip && pip install --upgrade aws-adfs==${VERSION}

CMD ["aws-adfs"]
