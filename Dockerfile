###############################
# Dockerfile for dbot         #
# Why? many dbots cool.	      #
###############################

# Set base image
FROM debian:latest

# Who made this? I did!
MAINTAINER shymega <shymega@shymega.org.uk>

## Add install script and run!
ADD ./install.sh /install.sh
RUN /install.sh

## Clone dbot repo into /home/dbot/dbot
RUN echo "Cloning repo..." && git clone https://github.com/reality/dbot.git /home/dbot/dbot

## Install!
WORKDIR /home/dbot/dbot
# I've exported EDITOR to echo so vim isn't run, as Docker seems to break vim in build-process.
RUN export EDITOR=/bin/echo && /home/dbot/dbot/install

## Add config manually, this can be updated per image-rebuild.
ADD ./config.json /home/dbot/dbot/config.json

## Add run script
ADD ./run.sh /run.sh

## Dbot own all his things
RUN chown -R dbot:dbot /home/dbot

# Set user as root
USER root
# Set CMD to /run.sh
CMD ["/run.sh"]
