## Overview
Sunlight an internal security tool to track who is logging into a Unix system, and what commands they perform. It is not bulletproof, as a knowledgable unix hacker could circumvent it, but it does provide more transparency to what is going on.

> Sunlight is the best disinfectant
- Mark Twain


## Features
* Optionallly lets the user know that they are being monitored upon logging in. Transparency goes both ways.
* Maintains a bash history file for each session, so they are not interleaved with others, and so they are stored permanently.
* Adds timestamps to the entries in the history files for better accounting.
* Allows for emails to be sent to a specified address when a user:
    * Logs in
    * Logs out
    
## Installation
1. Clone this repo to a location that is writeable only by root. Recommended: /etc/sunlight
2. Add an entry to the master /etc/bashrc to source the login watcher file:
    <code>source $install_dir/sunlight.bash</code>

Note: Only bash is currently supported. Check /etc/passwd to make sure that all users that are able to login have their shell set to <code>/bin/bash</code>

## Requirements
* Unix
* bash (if you want support other shells, please fork this repo and create sunlight.$yourshell)

## See also
For an extra level of protection, consider using this tool in combination with auditd

## TODO/Bugs/Known Issues
* Support for other shells
* Other logging/notification methods.
    * Copy the history file somewhere else?
    * Inject into a message queue?
* Automate the install/configuration
    * Create yum/apt-get packages
