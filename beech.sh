#!/bin/sh

function beech(){
    if [ $# -eq 0 ]; then
        echo "beech ~ tweet from your homerow"
        echo "usage : beech 'your message here'\n"
        return
    fi
    [ "$BEECH_CONF" ] || BEECH_CONF='default'
    source ~/.beech/$BEECH_CONF || return
    len=$(echo -n "$1" | wc -c)
    if [ "$len" -gt "140" ]; then
        echo "Tweet length is $len, exceeds max. 140 characters"
        return $len
    fi
    ENCODED=$(echo -n "$1" |  perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg');
    [ "$BEECH_VERBOSE" ] && echo -n "Sending tweet... "
    /usr/bin/curl -Ss -u $BEECH_USER:$BEECH_PASS -d "source=oak&status=$ENCODED" http://twitter.com/statuses/update.xml | grep 'error' | sed 's/<[^>]+>//g'
    [ "$BEECH_VERBOSE" ] && echo "DONE!"
    unset ENCODED BEECH_VERBOSE BEECH_PASS BEECH_USER BEECH_CONF
}
