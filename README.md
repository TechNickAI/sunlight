## Overview
Sunlight is an internal security tool aimed at providing transparency around what users are doing on a sensitive server. It tracks:
* Who is logging into a Unix system, with optional email notification
* What commands they perform (stored in separate history file per session), with optional email notification upon logout

Optionally informing the user know that they are being monitored when they login via a login message.  It is not bulletproof, as a knowledgable unix hacker could circumvent it, but it does provide more transparency to what is going on.

> Sunlight is the best disinfectant
> > Louis Brandeis


## Installation
1. Clone this repo to a location that is writeable only by root. Recommended: `/etc/sunlight`
2. Add an entry to the master `/etc/profile` to source the login watcher file:
    `. $install_dir/sunlight.bash`
3. Optional - configure your installation by copying `sunlight-default.conf` to `sunlight.conf` and making the appropriate changes
4. Watch/fork this repo on github. More usage will encourage me to build more features.

Note: Only the bash shell is currently supported. Check `/etc/passwd` to make sure that all users that are able to login have their shell set to `/bin/bash`


## Requirements
* bash (if you want support other shells, please fork this repo and create sunlight.$yourshell)


## See also
For an extra level of protection, consider using this tool in combination with [auditd](http://www.cyberciti.biz/tips/linux-audit-files-to-see-who-made-changes-to-a-file.html)


## Contributors
[Nick Sullivan](http://www.linkedin.com/in/nicksullivan)


## TODO/Bugs/Known Issues
* Other logging/notification methods.
    * Copy the history file somewhere else?
    * Inject into a message queue?
* Support for other shells
* Automate the install/configuration
    * Create yum/apt-get packages
