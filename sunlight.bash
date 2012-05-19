#!/bin/bash

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Look for a config file in the current directory
if [ -s $current_dir/sunlight.conf ] ; then
    . $current_dir/sunlight.conf
elif [ -s $current_dir/sunlight-default.conf ] ; then 
    . $current_dir/sunlight-default.conf
else 
    echo "Neither $current_dir/sunlight.conf nor $current_dir/sunlight-default.conf found, aborting sunlight"
    # Caution: Use return here, not exit, otherwise you will exit bash session
    return
fi

if [ "$SUNLIGHT_LOGIN_MESSAGE" != "" ] ; then
    echo $SUNLIGHT_LOGIN_MESSAGE
fi

# http://www.gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html#Bash-History-Builtins

# We are going to store each session as a separate file
bash_hist=$HOME/.history-bash
test -d $bash_hist || mkdir $HOME/.history-bash 

sship=`echo $SSH_CLIENT | awk '{print $1}'`
export HISTFILE=$bash_hist/hist-$sship-`date +%Y-%m-%d-%H-%M-%S`.hist

# Clean up files based on $SUNLIGHT_MAX_DAYS
if [ "$SUNLIGHT_MAX_DAYS" != "" ] ; then
    find ./ -mtime +$SUNLIGHT_MAX_DAYS | xargs rm -rf
fi

# Read in history from the previous history files, up until we hit HISTSIZE
for file in `ls -1tr $bash_hist`; do
    history -r $bash_hist/$file
    if [ `history | wc -l` -gt $HISTSIZE ] ; then
        break
    fi
done
