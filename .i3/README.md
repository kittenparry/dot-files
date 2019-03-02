## My Manjaro i3 settings

### Notes
* First run `systemctl disable tlp` on start by opening a new tty (ALT + F2*) and reboot to get rid of the suspention at start.
* ~~Install `video-nvidia`, reboot, install `video-vesa`, reboot, remove `video-vesa`, reboot. For whatever reason this, I suppose, was how I got my second monitor to work correctly. Meaning after first installation of `video-nvidia` it didn't appear on `xrandr`, then installing `video-vesa` screwed up everything, then removing it gave me the stuff I wanted.~~
* [This video](https://www.youtube.com/watch?v=am7xeUFQ8uY) and [these instructions](https://forum.manjaro.org/t/howto-set-up-prime-with-nvidia-proprietary-driver/40225) for driver installation.
* For tearing [this video](https://www.youtube.com/watch?v=_n5oOTvaGUg): In `sudo nvidia-settings` X Server Display Configuration, Advanced, Force Composition Pipeline. Then save to `/etc/X11/mhwd.d/nvidia.conf`. Doesn't seem to hold up on reboot, probably because of the tinkering done in the previous step. Doesn't matter. It activates when you switch it on and I rarely reboot so it's alright.
* `gpg --generate-key`, `gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv $KEY` before being able to `yaourt -S dropbox`.
* `playerctl` installed for media keys.
* After installing `polybar`, `install -Dm644 /usr/share/doc/polybar/ config $HOME/.config/polybar/config` & `chmod +x ~/.config/polybar/launch.sh`.
* `ip addr` to get network interface for network module of `polybar`.
* Spotify cache symlink `ln -s /mnt/disk-h/manjaro_storage/spotify ~/.cache/spotify`.
* Downloads symlink `ln -s /mnt/disk-e/Downloads.linux3/ ~/Downloads`. Delete Downloads folder before doing this.
* `git config --global credential.helper cache` && `git config --global credential.helper 'cache --timeout=3600'` (sets expiration of git credentials cache to 1 hour).
* In `/etc/default/grub`, `GRUB_TIMEOUT` to 0 to remove the start up delay. After change `sudo update-grub`.
* `git clone https://username@github.com/username/repo_name` to clone a private repo, prompts for password. Also `git config user.name/email "$info"`, just to note.

### Stuff
* `rofi` is used instead of `dmenu`.
* ~~`xterm` instead of `urxvt`~~.
* `mocp` terminal music player.
* `gnome-screenshot -i` for screenshot taking.
* `polybar` instead of `i3bar`.
* `fd` for file search.
* `sdcv` as a terminal dictionary.
	* [GNU/Linux English-English](https://web.archive.org/web/20140428004049/http://abloz.com/huzheng/stardict-dic/misc/stardict-xfardic-gnu-linux-2.4.2.tar.bz2).
	* [The Collaborative International Dictionary of English](https://web.archive.org/web/20140917131745/http://abloz.com/huzheng/stardict-dic/dict.org/stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2).
* or `dictd`, `dict-gcide`, `dict-wikt-en-al`, `moby-thesaurus`. ~~Though yet to figure out how to use thesaurus~~. Thesaurus text is printed when you `dict` something at times, I think.
	* [AskUbuntu thread](https://askubuntu.com/questions/191125/is-there-an-offline-command-line-dictionary) for both.
* Fonts placed in `~/.local/share/fonts`, FontAwesome for icons.
* `xdotool` to stimulate key presses.
* `i3-msg` to send i3 commands.
* `wal` ~~might be the future~~ creates a colour palette from an image. (`pywal`/`python-pywal`).
* `gotop-bin`/`gotop`, similar to `htop`, less informative, more visuals.
* `ncdu` to display disk usage in terminal.
* `mpv` video player.
* `gnome-disk-utility` for viewing and setting up mounts.
* `timeshift` (`timeshift-gtk`) to create/restore back ups.
* `alsamixer` for sound configurations.
