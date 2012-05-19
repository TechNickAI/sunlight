## Overview
Sunlight an internal security tool to track who is logging into a Unix system, and what commands they perform. It is not bulletproof, as a knowledgable unix hacker could circumvent it, but it does provide more transparency to what is going on.

> Sunlight is the best disinfectant
> > Louis Brandeis


## Features
* Optionally send emails to be sent to a specified address when a user:
    * Logs in
    * Logs out - *history of that session will be included*
* Maintains a bash history file for each session, so they are not interleaved with others, and so they are stored permanently (up to SUNLIGHT_MAX_FILES or SUNLIGHT_MAX_AGE, see config)
* Adds timestamps to the entries in the history files for better accounting.
* Optionallly lets the user know that they are being monitored upon logging in. Transparency goes both ways.
    

## Installation
1. Clone this repo to a location that is writeable only by root. Recommended: `/etc/sunlight`
2. Add an entry to the master `/etc/profile` to source the login watcher file:
    `. $install_dir/sunlight.bash`
3. Optional - configure your installation by copying `sunlight-sample.conf` to `sunlight.conf` and making the appropriate changes

Note: Only bash is currently supported. Check /etc/passwd to make sure that all users that are able to login have their shell set to `/bin/bash`


## Requirements
* Unix
* bash (if you want support other shells, please fork this repo and create sunlight.$yourshell)


## See also
For an extra level of protection, consider using this tool in combination with [auditd](http://www.cyberciti.biz/tips/linux-audit-files-to-see-who-made-changes-to-a-file.html)


## TODO/Bugs/Known Issues
* Support for other shells
* Other logging/notification methods.
    * Copy the history file somewhere else?
    * Inject into a message queue?
* Automate the install/configuration
    * Create yum/apt-get packages
