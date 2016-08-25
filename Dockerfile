FROM resin/rpi-raspbian:jessie
MAINTAINER Justin Garrison <justinleegarrison@gmail.com>

ADD inadyn /usr/local/bin/

CMD inadyn --ssl \
    --system ${SYSTEM} \
    --username ${USERNAME} \
    --password ${PASSWORD} \
    --alias ${ALIAS}
