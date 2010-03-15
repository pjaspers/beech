# A quick way to tweet from the command line
# As for the name: http://itunes.com/app/oak by @10to1
# Added 'oak' as source.
 
function beech(){
    # Twitter != Rocket Science, so security is not that much of an issue
    TWITTER_BEECH_USER="username"
    TWITTER_BEECH_PASS="password"
    
    if [ $# -ge 1 ]; then
        len=`echo -n "$1" | wc -c`
        if [ "$len" -gt "140" ]; then
            echo "Tweet length is $len, exceeds max. 140 characters"
        else
            ENCODED=$(echo -n "$1" |  perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg');
             # TODO correct parameter for extended regexes => BSD: `sed -E`; GNU: `sed -r`
             /usr/bin/curl -Ss -u $TWITTER_BEECH_USER:$TWITTER_BEECH_PASS -d "source=oak&status=$ENCODED" http://twitter.com/statuses/update.xml | grep 'error' | sed 's/<[^>]+>//g'
          #  echo "Test: $1"
        fi
    else
        echo "beech ~ tweet from your homerow"
        echo "usage : beech 'your message here'"
        echo " "
    fi
}