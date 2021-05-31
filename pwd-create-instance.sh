#!/usr/bin/env bash

export PWD_URL=`./create-instance/browser.js`
echo $PWD_URL > .pwd_url
echo "Created: ${PWD_URL}"