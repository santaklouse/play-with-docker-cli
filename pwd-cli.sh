#!/usr/bin/env sh

export PWD_URL='https://labs.play-with-docker.com/p/c2aerennjsv000eej7vg'
torsocks ./pwd-cli $@

#ssh trought tor -> pwd node
#torsocks ssh `./pwd-cli.sh nodes -adv | awk '{print $2}'`@direct.labs.play-with-docker.com