#!/bin/bash

# Start Redis
service redis-server start

# start dbot
su -c "node /home/dbot/dbot/run.js" dbot

