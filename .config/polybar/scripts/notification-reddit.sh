#!/bin/sh

# source
# https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/notification-reddit/notification-reddit.sh

# Open reddit.com/prefs/feeds/. Copy the JSON link from your inbox > unread messages.
URL=""
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/username"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    echo " $notifications"
else
    echo ""
fi
