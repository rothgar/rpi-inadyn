FROM resin/rpi-raspbian:stretch as build
MAINTAINER Justin Garrison <justin@linux.com>

ENV INADYN_VERSION=2.3.1

# install deps
RUN apt-get update && \
    apt-get install -y \
    libssl-dev \
    libconfuse-dev \
    automake \
    gcc \
    make \
    wget \
    pkg-config \
    autoconf \
    libtool \
    ca-certificates \
    build-essential

RUN wget https://github.com/troglobit/inadyn/releases/download/v${INADYN_VERSION}/inadyn-${INADYN_VERSION}.tar.xz -P /tmp
RUN tar xf /tmp/inadyn-${INADYN_VERSION}.tar.xz

WORKDIR inadyn-${INADYN_VERSION}

RUN ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-openssl \
    && make

RUN cp /inadyn-${INADYN_VERSION}/src/inadyn /

FROM resin/rpi-raspbian:stretch

RUN apt-get update \
    && apt-get install -y \
    libconfuse1 \
    && rm -rf /var/lib/apt/lists

COPY --from=build /inadyn /bin/

CMD /bin/inadyn --foreground
