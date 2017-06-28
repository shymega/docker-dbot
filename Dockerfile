################################
# Dockerfile for depressionbot #
################################

# Set base image (Alpine v3.6)
FROM alpine:3.6

# Set maintainer.
MAINTAINER Dom Rodriguez <shymega@shymega.org.uk>

# Phase 0 - package installation
RUN apk add --update nodejs nodejs-npm redis git wget unzip bash

# Phase 1 - create Docker user
ENV USERNAME docker
RUN addgroup -S "$USERNAME" \
    && adduser -S "$USERNAME" -h /docker \
    && adduser "$USERNAME" "$USERNAME"

  # Set user for the installation
USER "$USERNAME"


# Phase 2 - setup dbot.
  # Clone dbot into /docker/dbot
RUN git clone https://github.com/reality/dbot.git /docker/dbot

  # Install dbot using the provided script.
WORKDIR /docker/dbot
RUN EDITOR=/bin/true /docker/dbot/install

# Phase 3 - cleanup.

  # Set user back to root to cleanup
USER root
RUN apk del --no-cache --rdepends git py-pip g++ make

# Set user back to docker use for runtime execution
USER "$USERNAME"

# Set runtime command.
CMD ["node", "/docker/dbot/run.js"]
