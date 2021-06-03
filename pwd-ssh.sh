#!/usr/bin/env bash
NODE=`./pwd-cli.sh nodes -adv | awk '{print $2}'`
SSH_USER_HOST="${NODE}@direct.labs.play-with-docker.com"
echo "connecting to ${SSH_USER_HOST}"
$(which torsocks) $(which ssh) ${SSH_USER_HOST}