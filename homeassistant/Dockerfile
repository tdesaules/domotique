#   author: thibault@desaules.me
#   contributor: none
#   licence: Apache License, Version 2.0 (https://opensource.org/licenses/Apache-2.0)

FROM alpine:3.15
# info: set homeassistant version
ENV HOME_ASSISTANT_VERSION=2022.3.2
# info: configure the working directory
WORKDIR /opt/homeassistant
# info: copy base scripts to the created folder
COPY prerequisite.sh /tmp/prerequisite.sh
COPY install.sh /tmp/install.sh
# info: convert dos2unix
RUN dos2unix /tmp/prerequisite.sh
RUN dos2unix /tmp/install.sh
# info: run prerequisites
RUN /bin/ash /tmp/prerequisite.sh
# info: change user
USER homeassistant
# info: install homeassistant
RUN /bin/ash /tmp/install.sh
# info: command to run
CMD ["/opt/homeassistant/bin/hass"]
