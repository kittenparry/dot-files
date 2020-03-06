## My Manjaro i3 settings

### Notes
* First run `systemctl disable tlp` on start by opening a new tty (ALT + F2*) and reboot to get rid of the suspention at start.
* ~~Install `video-nvidia`, reboot, install `video-vesa`, reboot, remove `video-vesa`, reboot. For whatever reason this, I suppose, was how I got my second monitor to work correctly. Meaning after first installation of `video-nvidia` it didn't appear on `xrandr`, then installing `video-vesa` screwed up everything, then removing it gave me the stuff I wanted.~~
* [This video](https://www.youtube.com/watch?v=am7xeUFQ8uY) and [these instructions](https://forum.manjaro.org/t/howto-set-up-prime-with-nvidia-proprietary-driver/40225) for driver installation.
	* Additional to the above adding `Option "metamodes" "nvidia-auto-select +0+0 {ForceCompositionPipeline=On}"` to `/etc/X11/xorg.conf.d/optimus.conf` should auto set it on start (eg. the bullet below).
* For tearing [this video](https://www.youtube.com/watch?v=_n5oOTvaGUg): In `sudo nvidia-settings` X Server Display Configuration, Advanced, Force Composition Pipeline. Then save to `/etc/X11/mhwd.d/nvidia.conf`. Doesn't seem to hold up on reboot, probably because of the tinkering done in the previous step. Doesn't matter. It activates when you switch it on and I rarely reboot so it's alright.
* `gpg --generate-key`, `gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv $KEY` before being able to `yaourt -S dropbox`.
* `playerctl` installed for media keys.
* After installing `polybar`, `install -Dm644 /usr/share/doc/polybar/ config $HOME/.config/polybar/config` & `chmod +x ~/.config/polybar/launch.sh`.
* `ip addr` to get network interface for network module of `polybar`.
* Spotify cache symlink `ln -s /mnt/disk-e/manjaro-related/spotify ~/.cache/spotify`.
* Downloads symlink `ln -s /mnt/disk-e/Downloads.linux3/ ~/Downloads`. Delete Downloads folder before doing this.
	* Or `ln -s /mnt/disk-e/Downloads.linux3/ ~/dwn` for ease of typing.
	* [budlab's perfect folders video](https://www.youtube.com/watch?v=o8-6d8BW-V8) for better folder names.
* `git config --global credential.helper cache` && `git config --global credential.helper 'cache --timeout=3600'` (sets expiration of git credentials cache to 1 hour).
* In `/etc/default/grub`, `GRUB_TIMEOUT` to 0 to remove the start up delay. After change `sudo update-grub`.
	* Stopped working for some reason after a while, set it to 0.1 now, according to [a related answer on SO](https://askubuntu.com/a/1036957/371965).
* `git clone https://username@github.com/username/repo_name` to clone a private repo, prompts for password. Also `git config user.name/email "$info"`, just to note.
* `setxkbmap -layout us,de` && `setxkbmap -option 'grp:alt_shift_toggle'` for additional keyboard layouts. Needs to be placed in i3 config with `exec` for permament effect.
* In `deluge`, Preferences > Bandwidth > uncheck Rate limit IP overhead or suffer low low download speeds.
* Detach process from terminal by running it in the background by appending `&` at the end, then `jobs` to get its number and `disown %number` usually `%1`. First step may be lengthened by running the command, ctrl-z to stop it, `bg` to continue running it in the background.
* `file -i $file` to get file's mime type. `grep "$package" -l -r /usr/share/applications` to find its `.desktop` version (or here `~/.local/share/applications`). Manually change in `mimeapps.list` or `xdg-mime default transmission-gtk.desktop x-scheme-handler/magnet` (example assignment). To check current set program `xdg-mime query default x-scheme-handler/magnet` (ex). [Source](https://askubuntu.com/questions/62585/how-do-i-set-a-new-xdg-open-setting).
* `sudo ln -s /etc/ssl /usr/lib/ssl` to fix the connection issue of Borderlands 2.
* `sudo chown -R $USER:$USER /mnt/disk-ga` to fix the permission issue I've been having with the new partition.
	* To view permissions `ls -ld /data` for a directory, and `ls -l /data` for files.
	* ~~Gave back Steam Library to root by `sudo chown -R root:root /mnt/disk-ga/SteamLibrary`, otherwise I think I needed to reinstall all the games.~~
		* Ended up deleting the folder, creating it with correct permissions (eg. user permission) and re-installing games because I was receiving write errors on updates.
* League of Legends symlink so that Lutris doesn't just install it in home directory and partition `ln -s /mnt/disk-ga/lutris/league-of-legends ~/.wine-appimage-lol`
* `ffmpeg -i videofilename.ext out%5d.png`, get frames from a video (video to png). `-ss` option to specify a starting second and `-t` for the duration, eg. `ffmpeg -i videofilename.ext -ss 10 -t 1 out%5d.png`
* `gtk-application-prefer-dark-theme=false` in `$HOME/.config/gtk-3.0/settings.ini` to fix some GTK programs not following the settings of `lxappearance`.
* DOOM works properly with sounds using [steam-dos](https://github.com/dreamer/steam-dos) compatibility tool by creating the directory `~/.local/share/Steam/compatibilitytools.d/` and following the rest of the instructions with it.
* `ln -s /mnt/disk-j/recordurbate ~/programs/recordurbate/videos` to create [Recordurbate](https://github.com/oliverjrose99/Recordurbate) symlink.
* To generate a new locale uncomment the ones desired in `/etc/locale.gen`. `sudo locale-gen` to generate them. To check the available ones `locale -a`. To run a program with different locale for example `LANG=ja_JP.UTF-8 wine $name`.
* `sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts` to fix emoji and Japanese characters not displaying correctly in programs like Chrome and Discord.
* In GIMP, Edit > Preferences > Interface > Display, Monitor Resolution, decrease automatically detected 305x305 ppi to 100x100 to fix [#20](https://github.com/kittenparry/dot-files/issues/20).
* To fix Opera's video playback problem, get one of the releases of [nwjs-ffmpeg-prebuilt](https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases), put it into `/usr/lib64/opera`.
* `imwheel` to "fix" the mouse scroll speed.
* Install `dxvk` for "better" `wine` experience (sources: [reddit](https://www.reddit.com/r/linux_gaming/comments/856veg/what_is_dxvk_and_how_to_install/), [wine-vulkan](https://github.com/roderickc/wine-vulkan/blob/master/README.md)).
	* Install `dxvk-bin`
	* "c:\windows\winevulkan.json" in `~/.wine`:
		```
		{
		"file_format_version": "1.0.0",
		"ICD": {
			"library_path": "c:\\windows\\system32\\winevulkan.dll",
			"api_version": "1.0.51"
			}
		}
		```
	* Add registry keys by `WINEPREFIX=~/.wine wine regedit`:
		* `[HKEY_LOCAL_MACHINE\SOFTWARE\Khronos\Vulkan\Drivers\] "C:\Windows\winevulkan.json"=dword:00000000`
		* `[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Khronos\Vulkan\Drivers\] "C:\Windows\winevulkan.json"=dword:00000000`
	* Finally `WINEPREFIX=~/.wine setup_dxvk install`
* `ln -s /mnt/disk-f/_suicidegirls/ ~/sg` SG symlink
* Partition symlinks to home:
	```bash
	disks=({d..j} ga li ja); for d in "${disks[@]}"; do ln -s /mnt/disk-$d/ ~/$d; done
	```
* In `winecfg` add `winhttp` as native/builtin on Libraries tab for BepInEx to work properly.
* Install `winetricks` and `corefonts` with it to display lacking fonts.
* Getting keycodes/names with `xev` (`xorg-xev` package): `xev -event keyboard  | egrep -o 'keycode.*\)'`.
* Before installing `spicetify-cli`: `sudo chmod 777 /opt/spotify -R` as instructed [in their notes section](https://github.com/khanhas/spicetify-cli/wiki/Installation#note-for-linux-users), original value is `755`.
* The Sims 4 mods directory symlink: `ln -s /mnt/disk-ja/sims4/Mods "$HOME/Documents/Electronic Arts/The Sims 4/Mods"`
* `sudo pacman -Sy archlinux-keyring manjaro-keyring` to fix "broken" AUR keys*. Or maybe use a different server like `gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-key $KEY`.
	* `sudo pacman-key --populate archlinux manjaro` as well as `sudo pacman-key --refresh-keys`, though the second one doesn't seem to work.

### Stuff
* `rofi` is used instead of `dmenu`.
* ~~`xterm` instead of `urxvt`~~.
* `mocp` terminal music player.
* `gnome-screenshot -i` for screenshot taking.
* `polybar` instead of `i3bar`.
* `fd` for file search. Or `find . -name '*.jpg'`.
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
* `lxappearance` and `qt5ct` for configuring the appearance of the other programs.
* `figlet` for creating letters like these:
```
 __  __              _                 
|  \/  | __ _ _ __  (_) __ _ _ __ ___  
| |\/| |/ _` | '_ \ | |/ _` | '__/ _ \ 
| |  | | (_| | | | || | (_| | | | (_) |
|_|  |_|\__,_|_| |_|/ |\__,_|_|  \___/ 
                  |__/                 
```
* `progress` to get progress on, say, `mv`, `cp` etc. `watch progress -w` to watch progress <-- was really necessary.
* `sxiv-rifle` to browse through multiple images after opening one.
* `ex` to extract compressed files instead of `unzip`, `unrar x`, `7z x` and what not. Apparently [this](https://github.com/kittenparry/dot-files/blob/29f19cb94c951a547bafe4ba6c4bb4964cc869b7/.bashrc#L119) has been sitting here since the beginning.
* `lolcal` and `colorit` for colouring the output.
* `nvidia-smi` to check GPU usage. `watch -d -n 0.5 nvidia-smi` to watch it. `-d` highlights changed values, `-n %n` is to update it with given interval, default is 2s.
* `df -h .` to get disk space information on current dir/partition.
