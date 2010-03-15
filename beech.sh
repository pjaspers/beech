TWITTER_BEECH_USER='username'
TWITTER_BEECH_PASS='password'

function beech(){
    if [ $# -eq 0 ]; then
        echo "beech ~ tweet from your homerow"
        echo "usage : beech 'your message here'\n"
        return
    fi
    len=`echo -n "$1" | wc -c`
    if [ "$len" -gt "140" ]; then
        echo "Tweet length is $len, exceeds max. 140 characters"
        return $len
    fi
    ENCODED=$(echo -n "$1" |  perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg');
    /usr/bin/curl -Ss -u $TWITTER_BEECH_USER:$TWITTER_BEECH_PASS -d "source=oak&status=$ENCODED" http://twitter.com/statuses/update.xml | grep 'error' | sed 's/<[^>]+>//g'
}
