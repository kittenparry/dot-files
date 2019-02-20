## My Manjaro i3 settings

### Notes
* First run `systemctl disable tlp` on start by opening a new tty (ALT + F2*) and reboot to get rid of the suspention at start.
* Install `video-nvidia`, reboot, install `video-vesa`, reboot, remove `video-vesa`, reboot. For whatever reason this, I suppose, was how I got my second monitor to work correctly. Meaning after first installation of `video-nvidia` it didn't appear on `xrandr`, then installing `video-vesa` screwed up everything, then removing it gave me the stuff I wanted.
* `gpg --generate-key`, `gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv $KEY` before being able to `yaourt -S dropbox`.
* `playerctl` installed for media keys.
* After installing `polybar`, `install -Dm644 /usr/share/doc/polybar/ config $HOME/.config/polybar/config` & `chmod +x ~/.config/polybar/launch.sh`.


### Stuff
* `rofi` is used instead of `dmenu`.
* `xterm` instead of `urxvt`.
* `mocp` terminal music player.
* `gnome-screenshot -i` for screenshot taking.
* `polybar` instead of `i3bar`.
* `fd` for file search.
