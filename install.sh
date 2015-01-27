#!/bin/bash

echo "Installing nodejs and cURL and cleaning..."
apt-get update && apt-get -y -q install curl
curl -sL https://deb.nodesource.com/setup | bash -
apt-get -y -q install nodejs && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get -y -q clean

echo "Installing redis-server and cleaning..."
apt-get -q update && apt-get -y -q install redis-server && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get -y -q clean

echo "Installing tools (wget,unzip,git) and cleaning..."
apt-get -q update && apt-get -y -q install wget unzip git && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get -y -q clean

echo "Creating seperate account for dbot for security."
useradd -m dbot

