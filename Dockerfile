FROM resin/rpi-raspbian:jessie as build
MAINTAINER Justin Garrison <justin@linux.com>

ENV INADYN_VERSION=2.3.1

# install deps
RUN apt-get update && \
    apt-get install -y \
    libssl-dev automake gcc \
    make wget autoconf

RUN wget https://github.com/troglobit/inadyn/releases/download/v${INADYN_VERSION}/inadyn-${INADYN_VERSION}.tar.xz -P /tmp
RUN tar xf /tmp/inadyn-${INADYN_VERSION}.tar.xz

WORKDIR inadyn-${INADYN_VERSION}

RUN autoreconf -W portability -visfm && \
    ./configure --enable-openssl && \
    make

FROM alpine:latest

COPY --from=build /inadyn-${INADYN_VERSION}/src/inadyn /usr/local/bin/

CMD ["/usr/local/bin/inadyn", "--ssl", \
    "--system", "${SYSTEM}", \
    "--username", "${USERNAME}", \
    "--password", "${PASSWORD}" \
    "--alias", "${ALIAS}"]
