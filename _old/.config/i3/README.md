## My Ubuntu i3 settings
Used [this](https://www.youtube.com/playlist?list=PL5ze0DjYv5DbCv9vNEzFmP6sU7ZmkGzcf) video series as a guide.

* [playerctl](https://github.com/acrisci/playerctl) is needed for media keys (and possibly `pactl` if you're not on Ubuntu).
* `feh` is for setting background image.
* `arandr` is used to generate the `xrandr` output with the addition of `--rate 59.94`.
* [Font-Awesome](https://github.com/FortAwesome/Font-Awesome) for icon fonts ([cheatsheet](https://fontawesome.com/cheatsheet)).
* `~/.fonts` is where you place them.
* `rofi` is used instead of `dmenu`.
* `i3blocks` instead of `i3status`.
* `compton` for `rofi` opacity, `-f` for fade effect.
* `imagemagick` to convert jpg to png and `gimp` to resize the image.
* `i3-gaps` for gaps, installed following this [gist](https://gist.github.com/boreycutts/6417980039760d9d9dac0dd2148d4783).

### Notes
* `ranger` as file manager. also `pcmanfm`?
* `sxiv` as image viewer.

### Current Problems
* `xrandr --dpi 96` doesn't work
  * also possibly affects tray icons
* spotify didn't load correctly last time
