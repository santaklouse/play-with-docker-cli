#!/usr/bin/env bash

export PWD_URL=`./create-instance/browser.js`
echo $PWD_URL > .pwd_url
[ -z $PWD_URL ] || exit 0

echo "Create instance error"
exit 1