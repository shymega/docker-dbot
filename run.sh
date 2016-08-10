#!/bin/bash

# Start Redis
systemctl start redis.service

# start dbot
su -c "node /home/dbot/dbot/run.js" dbot

