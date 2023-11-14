FROM alpine:3.18 as release

RUN apk --update add --no-cache libstdc++ libgcc curl bash tar aws-cli openssl bind-tools \
  && rm -rf /var/cache/apk/*

ENV TARGETARCH=amd64
ENV KUBE_VERSION=1.28.3
RUN echo installing kubectl version v${KUBE_VERSION} \
  && curl -L -o /usr/local/bin/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/${TARGETARCH}/kubectl \
  && chmod +x /usr/local/bin/kubectl

ENV GOMPLATE_VERSION=v3.11.5
RUN curl -o /usr/local/bin/gomplate -sSL https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-${TARGETARCH} \
  && chmod 755 /usr/local/bin/gomplate

ENV YQ_VERSION=v4.9.8
RUN curl -sSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${TARGETARCH}.tar.gz \
  | tar -C /tmp --no-same-owner -xvzf - \
  && mv /tmp/yq_linux_amd64 /usr/local/bin/yq

ENV ISTIO_VERSION=1.18.5
RUN curl -L -o /tmp/istio.tgz \
  https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux-${TARGETARCH}.tar.gz \
  && tar --no-same-owner -C /tmp -xzf /tmp/istio.tgz istio-${ISTIO_VERSION}/bin/istioctl \
  && mv -v /tmp/istio-${ISTIO_VERSION}/bin/istioctl /usr/local/bin/ \
  && rm -rf /tmp/istio-${ISTIO_VERSION}

ENV KUSTOMIZE_VERSION=5.1.0
RUN echo installing kustomize version ${KUSTOMIZE_VERSION}
RUN echo  link: https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz
RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz \
  |  tar -xz --no-same-owner -C /usr/local/bin/

ENV HELM_VERSION=v3.12.0
RUN curl -L --silent https://get.helm.sh/helm-${HELM_VERSION}-linux-${TARGETARCH}.tar.gz \
  | tar -C /tmp --no-same-owner -xvzf - linux-${TARGETARCH}/helm \
  && mv /tmp/linux-${TARGETARCH}/helm /usr/local/bin \
  && rmdir /tmp/linux-${TARGETARCH}

ENV CILIUM_CLI_VERSION=v0.15.11
RUN curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${TARGETARCH}.tar.gz
RUN tar xzvfC cilium-linux-${TARGETARCH}.tar.gz /usr/local/bin
