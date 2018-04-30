FROM lachlanevenson/k8s-kubectl:v1.9.6 as kubectlContainer
FROM jimmycuadra/ktmpl:0.8.0 as ktmplContainer

FROM alpine:3.5
COPY --from=kubectlContainer /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=ktmplContainer /ktmpl /usr/local/bin/ktmpl
