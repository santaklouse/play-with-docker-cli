#!/usr/bin/env bash

#export PWD_URL='https://labs.play-with-docker.com/p/c2aerennjsv000eej7vg'
#export PWD_URL='https://labs.play-with-docker.com/p/c2n1tt7qf8u000atomhg#c2n1tt7q_c2n1u17qf8u000atomk0'
#export PWD_URL=`../pwd/browser.js`

DEBUG=
DEBUG=$([[ $# > 0 ]] || echo 1)

[ ! -z $DEBUG ]  && echo  ''
[ ! -z $DEBUG ]  && echo -n "Checking PWD instance URL..."
PWD_URL=`cat .pwd_url`
if [ -z "${PWD_URL}" ]; then
    [ ! -z $DEBUG ]  && echo -n 'Missing, recreating instance...'
    . ./pwd-create-instance.sh
    export PWD_URL
    [ ! -z $DEBUG ]  && echo 'Done.'
else
    [ ! -z $DEBUG ]  && echo 'Done.'
fi

# check PWD validity
[ ! -z $DEBUG ] && echo -n 'Checking validity...'
RESPONSE_CODE=`curl $PWD_URL -w '%{response_code}'  -o /dev/null -s`
[ ! -z $DEBUG ] && echo "${RESPONSE_CODE} code"
if [[ $RESPONSE_CODE != "200" ]]; then
    [ ! -z $DEBUG ] && echo -n 'Recreating instance...'
    . ./pwd-create-instance.sh
    export PWD_URL
    [ ! -z $DEBUG ] && echo 'Done.'
fi

export PWD_URL

# check created nodes and create if no nodes
#./pwd-cli.sh nodes | [[ `cat` == *"error"* ]] && torsocks ./pwd-cli create

torsocks ./pwd-cli $@

#ssh trought tor -> pwd node
#torsocks ssh `./pwd-cli.sh nodes -adv | awk '{print $2}'`@direct.labs.play-with-docker.com