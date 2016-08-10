################################
# Dockerfile for depressionbot #
################################

# Set base image
FROM debian:stable

# Set maintainer.
MAINTAINER shymega <shymega@shymega.org.uk>

# Add install script to the image.
ADD ./install.sh /install.sh
RUN /install.sh

## Add run script
ADD ./run.sh /run.sh

# Set runtime user as root.
USER root

# Set entrypoint to /run.sh
CMD ["/run.sh"]
