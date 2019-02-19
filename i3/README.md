## My Manjaro i3 settings

* First run `systemctl disable tlp` on start by opening a new tty (ALT + F2*) and reboot to get rid of the suspention at start.
* Install `video-nvidia`, reboot, install `video-vesa`, reboot, remove `video-vesa`, reboot. For whatever reason this, I suppose, was how I got my second monitor to work correctly. Meaning after first installation of `video-nvidia` it didn't appear on `xrandr`, then installing `video-vesa` screwed up everything, then removing it gave me the stuff I wanted.
