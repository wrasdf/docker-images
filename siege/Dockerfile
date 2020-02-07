FROM alpine:3.10
ENV VERSION=3.1.4

RUN apk -v --update add curl g++ make \
    && rm -rf /var/cache/apk/*

WORKDIR /app
RUN curl http://download.joedog.org/siege/siege-${VERSION}.tar.gz > siege-${VERSION}.tar.gz
RUN tar -xvf siege-${VERSION}.tar.gz \
    && cd siege-${VERSION} \
    && ./configure \
    && make install

ENTRYPOINT ["siege"]
CMD ["--help"]
