# Beech
Tweet from your homerow.

## Description
A quick way to post a tweet from the command line.

## Installation
1. Get the script: `git clone git://github.com/pjaspers/beech.git`
1. Make sure the script is loaded when you open a shell, so add the following line to your shell configuration file (e.g. `~/.bashrc` or `~/.zshrc`)

    source /path/to/beech/beech.sh
1. Store user configuration: Create a the file `~/.beech/default` and add the following lines:

    BEECH_USER='username'
    BEECH_PASS='password'
1. Open a new shell and just post tweets with the command: `beech 'My first tweet using beech'`

### Options
Optionally you can add `BEECH_VERBOSE=1` to your `~/.beech/default` configuration to turn on verbose output.

### Multiple users
Beech can be used for multiple users. This is how you do it:

1. Create a configuration file for each user (e.g. `~/.beech/me` and `~/.beech/myself`)
1. Add for each user an alias to your shell configuration:

    alias beech_me='BEECH_CONF=me; beech'
    alias beech_myself='BEECH_CONF=myself; beech'
1. Post tweets with these aliasses: `beech_me 'Hello this is me'` or `beech_myself 'Hello this is myself'`

Note: Using `beech` without such an alias will load the configuration from `~/.beech/default`.

## About
Inspired by and disguised as [oak](http://oakapp.com/) by [@10to1](http://twitter.com/10to1).
