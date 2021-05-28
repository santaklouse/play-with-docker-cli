#!/usr/bin/env sh

#export PWD_URL='https://labs.play-with-docker.com/p/c2aerennjsv000eej7vg'
#export PWD_URL='https://labs.play-with-docker.com/p/c2n1tt7qf8u000atomhg#c2n1tt7q_c2n1u17qf8u000atomk0'
#export PWD_URL=`../pwd/browser.js`

if [ -z "${PWD_URL}" ]; then
    . ./pwd-create-instance.sh
    export PWD_URL
fi

torsocks ./pwd-cli $@

#ssh trought tor -> pwd node
#torsocks ssh `./pwd-cli.sh nodes -adv | awk '{print $2}'`@direct.labs.play-with-docker.com