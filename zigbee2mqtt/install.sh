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
apk add --no-cache sudo bash nodejs npm
apk --purge del

# info: add a dedicated user to run zigbee2mqtt
addgroup -S zigbee2mqtt
adduser -D zigbee2mqtt -G zigbee2mqtt
addgroup zigbee2mqtt dialout
echo "zigbee2mqtt ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

# info: change the right
chgrp -Rf zigbee2mqtt /opt/zigbee2mqtt
chmod -Rf g+w /opt/zigbee2mqtt
chown -Rf zigbee2mqtt /opt/zigbee2mqtt
