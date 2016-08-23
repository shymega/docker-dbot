################################
# Dockerfile for depressionbot #
################################

# Set base image
FROM ubuntu

# Set maintainer.
MAINTAINER shymega <shymega@shymega.org.uk>

# Update aptitude
RUN apt-get -yq update

# Install utils
RUN apt-get -yq install unzip git curl

# Install Node
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get -yq update
RUN apt-get -yq install nodejs

# Install Redis
RUN apt-get -yq install redis-server

# Create account for dbot
RUN useradd -m dbot -s /bin/nologin

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
