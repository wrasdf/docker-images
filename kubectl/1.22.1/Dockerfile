FROM alpine:3.14

RUN apk -v --update add make curl bash jq openssl \
    && rm -rf /var/cache/apk/*

ENV KUBECTLVERSION v1.22.1
RUN curl -LO https://dl.k8s.io/release/${KUBECTLVERSION}/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/

ENTRYPOINT ["kubectl"]
