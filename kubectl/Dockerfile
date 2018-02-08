FROM alpine:3.6

RUN apk -v --update add make curl bash jq openssl \
    && rm -rf /var/cache/apk/*

ENV KUBECTLVERSION v1.8.0
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTLVERSION}/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/

ENTRYPOINT ["kubectl"]
