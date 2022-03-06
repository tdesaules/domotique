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
apk add --no-cache bash git make erlang-dev curl g++ snappy-dev bsd-compat-headers openssl-dev
apk --purge del

# info: build vernemq
git clone -b 1.12.4 https://github.com/vernemq/vernemq.git .
make rel
