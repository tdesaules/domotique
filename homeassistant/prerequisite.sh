#!/bin/ash

#     author: thibault@desaules.me
#     contributor: none
#     licence: Apache License, Version 2.0 (https://opensource.org/licenses/Apache-2.0)

# info: add edge repositories
echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# info: update and install mandatory package
apk --no-cache add ca-certificates
apk update
apk upgrade
apk add --no-cache bash sudo runuser git curl python3 python3-dev py3-virtualenv py3-pip libffi-dev libressl-dev openssl-dev jpeg-dev zlib-dev autoconf build-base tzdata tiff-dev
apk --purge del

# add an homeassistant user
addgroup -S homeassistant
adduser -D homeassistant -G homeassistant
echo "homeassistant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

# info: change the right
chgrp -Rf homeassistant /opt/homeassistant
chmod -Rf g+w /opt/homeassistant
chown -Rf homeassistant /opt/homeassistant
