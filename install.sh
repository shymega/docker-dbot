#!/bin/bash

echo "Update aptitude DB.."
apt-get -yq update

echo "Install utilities.."
apt-get -yq install wget unzip git

echo "Install Node.js.."
apt-get -yq install curl
curl -sL https://deb.nodesource.com/setup | bash -
apt-get -yq install nodejs

echo "Install Redis.."
apt-get -yq install redis-server

echo "Creating account for dbot.."
useradd -m dbot -s /bin/nologin

echo "Clone dbot into dbot home.."
git clone https://github.com/reality/dbot.git /home/dbot/dbot

echo "Install dbot.."
# Set EDITOR variable to /bin/false - this should prevent dbot's
# install script opening vim to edit the configuration file.
# For the record, we inject the configuration from the host.

EDITOR=/bin/false /home/dbot/dbot/install

echo "Set permissions for dbot.."
chown -R dbot:dbot /home/dbot

echo "Cleaning up.."
apt-get -yq clean

echo "Finished."
