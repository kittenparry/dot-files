export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/opera
# append ~/.scripts and its subdirs to path
if [ -d "$HOME/.scripts" ]; then
	export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
fi
export BAT_THEME="GitHub" # GitHub or base16 for light theme
# fixes VLC and Calibre's scaling issue (#20)
export QT_AUTO_SCREEN_SCALE_FACTOR=0
# mouse scrollable less
export LESS='--mouse --wheel-lines=3'
