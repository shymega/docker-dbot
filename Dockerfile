################################
# Dockerfile for depressionbot #
################################

# Set base image
FROM ubuntu:16.04

# Set maintainer.
MAINTAINER shymega <shymega@shymega.org.uk>

# Prepare for Node.js install
ADD https://deb.nodesource.com/setup_6.x /setup_6.x
RUN bash < /setup_6.x
# Update aptitude and install pkgs
RUN apt-get -yq update && apt-get -yq install nodejs unzip git curl redis-server

# Create account for dbot
RUN useradd -rm dbot

# Clone dbot
RUN git clone git://github.com/reality/dbot.git /home/dbot/dbot

# Install dbot
RUN EDITOR=/bin/true /home/dbot/dbot/install

# Set perms to dbot user
RUN chown -R dbot:dbot /home/dbot

## Add run script
ADD ./run.sh /run.sh

# Set runtime user as dbot.
USER dbot

# Set entrypoint to /run.sh
CMD ["node", "/home/dbot/dbot/run.js"]
