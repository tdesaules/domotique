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
apk add --no-cache bash git make curl erlang erlang-dev cmake gcc g++ perl ncurses-dev openssl-dev coreutils linux-headers build-base bsd-compat-headers libc-dev libstdc++
apk --purge del

# info: build emqx
git clone -b v4.4.1 https://github.com/emqx/emqx.git .
make
