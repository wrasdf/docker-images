FROM alpine:3.17 as builder

RUN apk --update add --no-cache libstdc++ libgcc curl upx bash tar \
  && rm -rf /var/cache/apk/*

ARG TARGETARCH
ARG KUBE_VERSION
RUN echo installing kubectl version v${KUBE_VERSION} \
  && curl -L -o /usr/local/bin/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/${TARGETARCH}/kubectl \
  && chmod +x /usr/local/bin/kubectl

ARG GOMPLATE_VERSION
RUN curl -o /usr/local/bin/gomplate -sSL https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-${TARGETARCH} \
  && chmod 755 /usr/local/bin/gomplate

ARG YQ_VERSION
RUN curl -sSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${TARGETARCH}.tar.gz \
  | tar -C /tmp --no-same-owner -xvzf - \
  && mv /tmp/yq_linux_amd64 /usr/local/bin/yq

ARG ISTIO_VERSION
RUN curl -L -o /tmp/istio.tgz \
  https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux-${TARGETARCH}.tar.gz \
  && tar --no-same-owner -C /tmp -xzf /tmp/istio.tgz istio-${ISTIO_VERSION}/bin/istioctl \
  && mv -v /tmp/istio-${ISTIO_VERSION}/bin/istioctl /usr/local/bin/ \
  && rm -rf /tmp/istio-${ISTIO_VERSION}

ARG KUSTOMIZE_VERSION
RUN echo installing kustomize version ${KUSTOMIZE_VERSION}
RUN echo  link: https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz
RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz \
  |  tar -xz --no-same-owner -C /usr/local/bin/

ARG HELM_VERSION
RUN curl -L --silent https://get.helm.sh/helm-${HELM_VERSION}-linux-${TARGETARCH}.tar.gz \
  | tar -C /tmp --no-same-owner -xvzf - linux-${TARGETARCH}/helm \
  && mv /tmp/linux-${TARGETARCH}/helm /usr/local/bin \
  && rmdir /tmp/linux-${TARGETARCH}

ARG CILIUM_CLI_VERSION
ARG CLI_ARCH=amd64
RUN curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz
RUN tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin

FROM amazon/aws-cli:2.13.7 as release

RUN yum -y install make jq openssh-clients bash \
  && rm -rf /var/cache/yum/*

COPY --from=builder --chown=root:rocot \
  /usr/local/bin/kubectl \
  /usr/local/bin/gomplate \
  /usr/local/bin/istioctl \
  /usr/local/bin/yq \
  /usr/local/bin/kustomize \
  /usr/local/bin/helm \
  /usr/local/bin/cilium \
  /usr/local/bin/

CMD [ "bash" ]