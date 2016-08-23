################################
# Dockerfile for depressionbot #
################################

# Set base image
FROM ubuntu:16.04

# Set maintainer.
MAINTAINER shymega <shymega@shymega.org.uk>

# Prepare for Node.js install
RUN add-apt-repository ppa:chris-lea/node.js
# Update aptitude and install pkgs
RUN apt-get -yq update && apt-get -yq install nodejs unzip git curl redis-server

# Create account for dbot
RUN useradd -rm dbot

# Clone dbot
RUN git clone git://github.com/reality/dbot.git /home/dbot/dbot

# Install dbot
ENV editor /bin/false
RUN /home/dbot/dbot/install

# Set perms to dbot user
RUn chown -R dbot:dbot /home/dbot

## Add run script
ADD ./run.sh /run.sh

# Set runtime user as root.
USER dbot

# Set entrypoint to /run.sh
CMD ["su", "-c", "node /home/dbot/dbot/run.js", "dbot"]
