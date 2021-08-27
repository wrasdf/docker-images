FROM python:3.9.1-alpine3.12

RUN apk update && apk add make curl jq bash openssl
RUN pip install awscli

ENV KUBECTLVERSION v1.22.1
RUN curl -LO https://dl.k8s.io/release/${KUBECTLVERSION}/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/
