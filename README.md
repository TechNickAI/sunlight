## Overview
Sunlight is an internal security tool aimed at providing transparency around what users are doing on a sensitive server. It tracks:
* Who is logging into a Unix system, with optional email notification
* What commands they perform (stored in a separate history file per session), with optional email notification upon logout

Optionally informing the user that they are being monitored via a login message. It is not bulletproof, as a knowledgable unix hacker could circumvent it, but it does provide more information on what is going on.

> Sunlight is the best disinfectant
> > Louis Brandeis


## Installation
1. Clone this repo. For extra security, put it in a location that is writeable only by root. Recommended: `/etc/sunlight`
2. Add an entry to the master `/etc/profile` to source the login watcher file:
    `. $install_dir/sunlight.bash`
    Note: This is the preferred method, because it will track all logins. If you do not have root access and or wish to only track specific users, then you can place the line above into `$HOME/.profile` instead
3. Configure your installation by copying `sunlight-default.conf` to `sunlight.conf` and making the appropriate changes
4. **Watch/fork this repo on github**. :) More usage will encourage me to build more features.

Note: Only the bash shell is currently supported. Check `/etc/passwd` to make sure that all users that are able to login have their shell set to `/bin/bash`


## Requirements
* bash (if you want support other shells, please fork this repo and create sunlight.$yourshell)


## Contributors
[Nick Sullivan](http://www.linkedin.com/in/nicksullivan)


## TODO
* Custom logging/notification methods, copy the history file somewhere else, inject into a message queue, etc.
* Support for other shells
* Automate the install/configuration
    * Create yum/apt-get packages
   

## Bugs/Known Issues
* Do not rely on this as your only security measure. It is just a tool that provides more information. It can be circumvented in ways that I would rather not list here, and should not be compltely relied upon. 
* If the user does not properly exit the shell (ie, network interruption that kills the ssh session), `~/.bash_logout` will not be executed and the logout notifier will not work. If this bothers you, setting up [auditd](http://www.cyberciti.biz/tips/linux-audit-files-to-see-who-made-changes-to-a-file.html) and a daemon that regularly calls `lastcomm` might do the trick
