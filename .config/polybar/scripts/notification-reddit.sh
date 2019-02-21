#!/bin/sh

# source
# https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/notification-reddit/notification-reddit.sh

# Open reddit.com/prefs/feeds/. Copy the JSON link from your inbox > unread messages.
URL=""
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/username"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
	# reddit-alien in reddit's colour
	# open chrome on unread messages and switch to ws1
	echo "%{A1:google-chrome-stable https\://www.reddit.com/message/unread/ ; i3-msg '[class=\"Google-chrome\"]' focus:}%{F#ff4500} $notifications%{F-}%{A}"
else
	# open reddit and switch to ws1
	echo "%{A1:google-chrome-stable https\://www.reddit.com/ ; i3-msg '[class=\"Google-chrome\"]' focus:}%{A}"
fi
