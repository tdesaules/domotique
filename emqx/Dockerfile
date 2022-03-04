#   author: thibault@desaules.me
#   contributor: none
#   licence: Apache License, Version 2.0 (https://opensource.org/licenses/Apache-2.0)

FROM alpine:3.15 AS builder
# info: configure the working directory
WORKDIR /opt/emqx
# info: copy base scripts to the created folder
COPY build.sh /root/build.sh
# info: convert dos2unix
RUN dos2unix /root/build.sh
# info: run script to prepare env
RUN /bin/ash /root/build.sh


FROM alpine:3.15
# info: copy base scripts to the created folder
COPY --from=builder /opt/emqx/_build/emqx/rel/emqx /opt/emqx
COPY install.sh /root/install.sh
# info: convert dos2unix
RUN dos2unix /root/install.sh
# info: install and dependencies
RUN /bin/ash /root/install.sh
# info: change user
USER emqx
# info: command to run
CMD ["/opt/emqx/bin/emqx", "foreground"]
