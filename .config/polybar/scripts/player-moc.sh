#!/bin/sh

# source
# https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/player-moc/player-moc.sh

if [ "$(mocp -Q %state)" != "STOP" ];then
    SONG=$(mocp -Q %song)
        
    if [ -n "$SONG" ]; then
        echo "$(mocp -Q %artist) - $SONG"
    else
        basename "$(mocp -Q %file)"
    fi
else
    echo ""
fi
