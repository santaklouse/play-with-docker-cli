#!/usr/bin/env bash

$(which torsocks) $(which ssh) `./pwd-cli.sh nodes -adv | awk '{print $2}'`@direct.labs.play-with-docker.com