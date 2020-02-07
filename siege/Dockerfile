FROM alpine:3.10
ENV VERSION=4.0.4

RUN apk update \
    && apk add curl g++ make \
    && curl http://download.joedog.org/siege/siege-$VERSION.tar.gz > siege-$VERSION.tar.gz \
    && tar -xf siege-${VERSION}.tar.gz \
    && cd siege-${VERSION} \
    && ./configure \
    && make install

ENTRYPOINT ["siege"]
CMD ["--help"]
