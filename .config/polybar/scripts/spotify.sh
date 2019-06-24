#!/bin/sh

# source
# https://github.com/NicholasFeldman/dotfiles/blob/master/polybar/.config/polybar/spotify.sh

main() {
	if ! pgrep -x spotify >/dev/null; then
		echo ""; exit
	fi  

	cmd="org.freedesktop.DBus.Properties.Get"
	domain="org.mpris.MediaPlayer2"
	path="/org/mpris/MediaPlayer2"

	meta=$(dbus-send --print-reply --dest=${domain}.spotify \
		/org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:${domain}.Player string:Metadata)

	artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1  | sed 's/\&/\\&/g' | sed 's#\/#\\/#g')
	album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1| sed 's/\&/\\&/g'| sed 's#\/#\\/#g')
	title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 | sed 's/\&/\\&/g'| sed 's#\/#\\/#g')

	# source for this condition checking idea
	# https://gist.github.com/wandernauta/6800547#gistcomment-1873759
	# https://muffinresearch.co.uk/ubuntu-lock-screen-and-pause-spotify/
	# checks if the title bar is not Spotify, if it outputs nothing to module

	title_bar=$(wmctrl -l | grep -o -e "Spotify Premium$")
	if [[ "$title_bar" != "Spotify Premium" ]]
	then
		echo "${*:-%artist% - %title%}" | sed "s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | sed "s/\&/\&/g" | sed "s#\/#\/#g"
	else
		echo ""; exit
	fi

}

main "$@"
