#!/bin/bash
# Pre-Reqs
# Copy different account credentials (access keyid / access key)
# and configs ( regions , output formats etc ) in acct named directory
# then use this tool to switch to different accts
# Date: 02-08-2020
# Ver : 0.4
# Auth: Zee Rizvi @ irsols

if [ -z "$1" ]
     then
       echo
       echo " No Account Directory provided , check syntax"
       echo " Usage : set-acct.sh <dir-name> "
       exit
   fi
#Define directory
accountDir=$1

cd $HOME/.aws
rm config
rm credentials
ln -s $accountDir/config ./config
ln -s $accountDir/credentials ./credentials
