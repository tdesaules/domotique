#   author: thibault@desaules.me
#   contributor: none
#   licence: Apache License, Version 2.0 (https://opensource.org/licenses/Apache-2.0)

FROM alpine:3.15 AS builder
# info: set vernemq version
ENV VERNEMQ_VERSION=1.12.4
# info: configure the working directory
WORKDIR /opt/vernemq
# info: copy base scripts to the created folder
COPY build.sh /root/build.sh
# info: convert dos2unix
RUN dos2unix /root/build.sh
# info: run script to prepare env
RUN /bin/ash /root/build.sh


FROM alpine:3.15
# info: configure the working directory
WORKDIR /opt/vernemq
# info: copy base scripts to the created folder
COPY --from=builder /opt/vernemq/_build/default/rel/vernemq /opt/vernemq
COPY install.sh /root/install.sh
# info: convert dos2unix
RUN dos2unix /root/install.sh
# info: install and dependencies
RUN /bin/ash /root/install.sh
# info: change user
USER vernemq
# info: command to run
CMD ["sleep", "infinity"]
#CMD ["bin/vernemq", "console", "-noshell", "-noinput", "$@", "&"]
