#/bin/sh

# glitchy lock script, source:
# https://github.com/x-zvf/dotfiles/blob/master/scripts/scrlock.sh

pngfile="/tmp/sclock.png"
bmpfile="/tmp/sclock.bmp"
glitchedfile="/tmp/sclock_g.bmp"

scrot -z $pngfile

# convert to bmp and pixelate
magick convert -scale 20% -scale 500% $pngfile $bmpfile

# Glitch it with sox FROM: https://maryknize.com/blog/glitch_art_with_sox_imagemagick_and_vim/
sox -t ul -c 1 -r 48k $bmpfile -t ul $glitchedfile trim 0 100s : echo 0.9 0.9 15 0.9

# Rotate it by 90 degrees
magick convert -rotate 90 $glitchedfile $bmpfile

#Glitch it again and rotate it back
sox -t ul -c 1 -r 48k $bmpfile -t ul $glitchedfile trim 0 90s : echo 0.9 0.9 15 1
magick convert -rotate -90 $glitchedfile $glitchedfile

# Add lock icon, pixelate and convert back to png
magick convert -gravity center -font "Font-Awesome-5-Free-Solid" \
    -pointsize 200 -draw "text -640,0 ''" -channel RGBA -fill '#bf616a' \
    $glitchedfile $pngfile

# -u disables circle indicator when entering characters
# -e doesn't try to authenticate when no character is entered
i3lock -e -i $pngfile
rm $pngfile $bmpfile $glitchedfile
