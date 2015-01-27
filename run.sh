#!/bin/bash
# start redis-server
service redis-server start
# start dbot under dbot user
su -c "node /home/dbot/dbot/run.js" dbot

