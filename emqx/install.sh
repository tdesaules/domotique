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
apk add --no-cache erlang curl ncurses-libs openssl sudo libstdc++ bash
apk --purge del

# info: link binaries
ln -s /opt/emqx/bin/* /usr/local/bin/

# info: add a dedicated user to run emqx
addgroup -S emqx
adduser -D emqx -G emqx
echo "emqx ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

# info: change the right
chgrp -Rf emqx /opt/emqx
chmod -Rf g+w /opt/emqx
chown -Rf emqx /opt/emqx
