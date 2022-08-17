################################
# Dockerfile for depressionbot #
################################

# Set base image (Alpine, running on Node.js 17)
FROM docker.io/node:17-alpine

# Specify locked Git revision
ENV LOCKED_GIT_REV=a77c6296f1d2b5252e71e8306fffc5b0f72d845f

# Set maintainer.
LABEL maintainer="Dom Rodriguez <shymega@shymega.org.uk>"

# Phase 0 - package installation
RUN apk add --update git wget unzip bash

# Phase 1 - create Docker user
RUN addgroup app \
    && adduser -h /app -D -G app app

# Set user for the installation
USER app

# Phase 2 - setup dbot.
# Clone dbot into `/app/dbot`
RUN git clone https://github.com/shymega/dbot.git /app \
    && cd /app \
    && git checkout "${LOCKED_GIT_REV}"

# Install dbot using the provided script.
WORKDIR /app
RUN EDITOR=/bin/true /app/install

# Phase 3 - cleanup.

# Set user back to root to cleanup
USER root
RUN apk del --no-cache --rdepends git py-pip g++ make

# Set user back to `app` use for runtime execution
USER app

# Set runtime command.
CMD ["node", "/app/run.js"]
