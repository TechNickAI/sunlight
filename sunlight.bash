#!/bin/bash

current_dir=$PWD
# Look for a config file in the current directory
if [ -s $current_dir/sunlight.conf ] ; then
    . $current_dir/sunlight.conf
elif [ -s $current_dir/sunlight-default.conf ] ; then 
    . $current_dir/sunlight-default.conf
else 
    echo "Neither $current_dir/sunlight.conf nor $current_dir/sunlight-default.conf found, exiting..."
    exit 1
fi

if [ "$SUNLIGHT_LOGIN_MESSAGE" != "" ] ; then
    echo $SUNLIGHT_LOGIN_MESSAGE
fi
